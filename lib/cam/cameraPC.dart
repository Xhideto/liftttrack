import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'dart:math';
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:typed_data';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController? _controller;
  File? _videoFile;
  final ImagePicker _picker = ImagePicker();
  List<File> _frames = [];
  List<Map<String, dynamic>> _framesInBytes = [];

  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isDenied) {
      // Request camera permission
      if (await Permission.camera.request().isGranted) {
        // Permission granted
        _pickVideo(); // Call your function to record video
      } else {
        // Permission denied
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Camera permission is required to record video')),
        );
      }
    } else if (status.isPermanentlyDenied) {
      // Open settings to manually allow permission
      openAppSettings();
    } else {
      // Permission already granted
      _pickVideo();
    }
  }

  Future<void> _pickVideo() async {
    Future<void> _requestCameraPermission() async {
      var status = await Permission.camera.status;

      if (status.isDenied) {
        // Request camera permission
        if (await Permission.camera.request().isGranted) {
          // Permission granted
          _pickVideo(); // Call your function to record video
        } else {
          // Permission denied
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Camera permission is required to record video')),
          );
        }
      } else if (status.isPermanentlyDenied) {
        // Open settings to manually allow permission
        openAppSettings();
      } else {
        // Permission already granted
        _pickVideo();
      }
    }
    var status = await Permission.camera.request();

    if (status.isGranted) {
      // Permission granted, proceed with video recording
      final pickedFile = await _picker.pickVideo(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _videoFile = File(pickedFile.path);
        });

        if (_videoFile != null) {
          final videoOrientation = await FlutterVideoInfo().getVideoInfo(_videoFile!.path);
          if (videoOrientation != null && videoOrientation.orientation == 90) {
            // Rotate the video 90 degrees clockwise
            final directory = await getApplicationDocumentsDirectory();
            final outputFilePath = '${directory.path}/rotated_video.mp4';
            final session = await FFmpegKit.executeAsync('-i ${_videoFile!.path} -vf transpose=1 $outputFilePath');
            final returnCode = await session.getReturnCode();
            if (ReturnCode.isSuccess(returnCode)) {
              // Delete the original file
              _videoFile?.delete();

              setState(() {
                _videoFile = File(outputFilePath);
              });
            } else {
              print('Failed to rotate video');
            }
          }
        }

        // Initialize the VideoPlayerController after video rotation
        if (_videoFile != null) {
          _controller = VideoPlayerController.file(_videoFile!)
            ..initialize().then((_) async {
              setState(() {});
              if (_controller != null) {
                _controller!.play();
              }
              // Automatically extract frames after video is loaded
              await _extractFrames();
            });
        }
      }
    } else if (status.isDenied) {
      // Permission denied, show message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Camera permission is required to record video'),
      ));
    } else if (status.isPermanentlyDenied) {
      // Handle the case where the user has denied permission permanently
      openAppSettings();
    }
  }

  Future<void> _extractFrames() async {
    if (_videoFile == null) return;

    final directory = await getApplicationDocumentsDirectory();
    final outputDir = Directory('${directory.path}/frames');
    if (!await outputDir.exists()) {
      await outputDir.create(recursive: true);
    }

    final outputPattern = '${outputDir.path}/frame_%03d.png';
    final command = '-i ${_videoFile!.path} -vf fps=30 $outputPattern';

    await FFmpegKit.executeAsync(command, (session) async {
      final returnCode = await session.getReturnCode();
      if (ReturnCode.isSuccess(returnCode)) {
        final frameFiles = outputDir.listSync().where((item) => item.path.endsWith('.png')).toList();

        // Clear previous frame data before storing new ones
        _framesInBytes.clear();

        for (var file in frameFiles) {
          // Convert the frame file into bytes
          final bytes = await File(file.path).readAsBytes();
          final frameData = {
            'framePath': file.path,
            'frameBytes': bytes
          };
          _framesInBytes.add(frameData);
        }

        // Save the frames as bytes in a JSON file
        await _saveFramesToJson();

        setState(() {
          _frames = frameFiles.map((item) => File(item.path)).toList();
        });
      } else {
        print('Frame extraction failed');
      }
    });
  }

  Future<void> _saveFramesToJson() async {
    final directory = await getApplicationDocumentsDirectory();
    final jsonFilePath = '${directory.path}/frames.json';

    // Create a template for each frame to be saved in JSON
    List<Map<String, String>> frameTemplateList = [];

    // Convert _framesInBytes to JSON format using a template
    _framesInBytes.forEach((frame) {
      frameTemplateList.add({
        'framePath': frame['framePath'], // Path to the frame file
        'frameBytes': base64Encode(frame['frameBytes']), // Encode bytes as base64 for JSON storage
      });
    });

    // Serialize the list of frames to JSON
    final jsonData = jsonEncode({
      'frames': frameTemplateList, // Store all frames in a 'frames' array
    });

    // Write JSON data to file
    final jsonFile = File(jsonFilePath);
    await jsonFile.writeAsString(jsonData);
    print('Frames saved to JSON file: $jsonFilePath');
  }

  Future<void> _uploadVideo() async {
    if (_videoFile == null) return;

    // Create a WebSocket channel (replace 'ws://your-websocket-url' with your actual WebSocket endpoint)
    final channel = IOWebSocketChannel.connect('ws://your-websocket-url');

    // Read the video file as bytes
    Uint8List videoBytes = await _videoFile!.readAsBytes();

    // Send the video file to the server via WebSocket
    channel.sink.add(videoBytes);

    // Listen for server response
    channel.stream.listen((response) {
      if (response == 'Video uploaded successfully') {
        print('Video uploaded successfully');
      } else {
        print('Video upload failed');
      }
    }, onError: (error) {
      print('WebSocket error: $error');
    }, onDone: () {
      print('WebSocket connection closed');
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record and Play Video'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _videoFile == null
                  ? Text('No video recorded')
                  : _controller != null && _controller!.value.isInitialized
                  ? Transform.rotate(
                angle: 90 * pi / 180, // Rotate by 90 degrees
                alignment: Alignment.center, // Rotate around the center
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.height * 10.8, // Swap width and height
                    maxHeight: MediaQuery.of(context).size.height * 20.0, // Swap width and height
                  ),
                  child: AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio *
                        (MediaQuery.of(context).size.height / MediaQuery.of(context).size.width), // Adjust aspect ratio
                    child: VideoPlayer(_controller!),
                  ),
                ),
              )
                  : Container(),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: _pickVideo,
                child: Text('Record Video'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadVideo,
                child: Text('Upload Video'),
              ),
              SizedBox(height: 20),
              _frames.isEmpty
                  ? Text('No frames extracted')
                  : ListView.builder(
                shrinkWrap: true,
                itemCount: _frames.length,
                itemBuilder: (context, index) {
                  return Image.file(_frames[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
