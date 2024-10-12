import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_video_info/flutter_video_info.dart';
import 'dart:math';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController? _controller;
  File? _videoFile;
  final ImagePicker _picker = ImagePicker();
  List<File> _frames = [];

  Future<void> _pickVideo() async {
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
        setState(() {
          _frames = frameFiles.map((item) => File(item.path)).toList();
        });
      } else {
        print('Frame extraction failed');
      }
    });
  }

  Future<void> _uploadVideo() async {
    if (_videoFile == null) return;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('YOUR_API_ENDPOINT'), // Replace with your actual API endpoint
    );
    request.files.add(await http.MultipartFile.fromPath(
      'video',
      _videoFile!.path,
    ));
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Video uploaded successfully');
    } else {
      print('Video upload failed');
    }
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
