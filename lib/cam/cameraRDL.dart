import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';
import 'dart:convert';
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
  IOWebSocketChannel? _channel;
  List<Uint8List> _annotatedFrames = []; // Store annotated frames for display

  Future<void> _pickVideo() async {
    // Request camera permission
    var status = await Permission.camera.request();

    if (status.isGranted) {
      // Open the camera to record a video
      final pickedFile = await _picker.pickVideo(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _videoFile = File(pickedFile.path);
        });

        // Connect to WebSocket after recording
        _connectWebSocket();

        // Initialize video controller and extract frames
        if (_videoFile != null) {
          _controller = VideoPlayerController.file(_videoFile!)
            ..initialize().then((_) async {
              setState(() {});
              if (_controller != null) {
                _controller!.play();
              }
              await _extractAndSendFrames(); // Start sending frames to server
            });
        }
      } else {
        print('No video recorded');
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Camera permission is required to record video')),
      );
    }
  }

  Future<void> _connectWebSocket() async {
    try {
      _channel = IOWebSocketChannel.connect('ws://192.168.1.233:8000/ws-tracking');

      // Confirm connection attempt
      print('Attempting to connect to WebSocket...');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Attempting to connect to WebSocket server...')),
      );

      // Confirm successful connection
      _channel?.stream.listen((data) async {
        if (data != null) {
          print('Data received from server: $data');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data received from server')),
          );
        }
      }, onError: (error) {
        print('WebSocket error: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('WebSocket error: $error')),
        );
      }, onDone: () {
        print('WebSocket connection closed by server');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server closed the WebSocket connection')),
        );
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connected to WebSocket server')),
      );
    } catch (error) {
      print('WebSocket connection failed with error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('WebSocket connection failed: $error')),
      );
    }
  }

  Future<void> _extractAndSendFrames() async {
    if (_videoFile == null || _channel == null) return;

    final directory = await getApplicationDocumentsDirectory();
    final outputDir = Directory('${directory.path}/frames');
    if (!await outputDir.exists()) {
      await outputDir.create(recursive: true);
    }

    // Extraction command for frames
    final outputPattern = '${outputDir.path}/frame_%03d.png';
    final command = '-i ${_videoFile!.path} -vf fps=30 $outputPattern';

    await FFmpegKit.executeAsync(command, (session) async {
      final returnCode = await session.getReturnCode();
      if (ReturnCode.isSuccess(returnCode)) {
        final frameFiles = outputDir.listSync().where((item) => item.path.endsWith('.png')).toList();

        for (var file in frameFiles) {
          final bytes = await File(file.path).readAsBytes();
          _channel?.sink.add(base64Encode(bytes)); // Send frame bytes to server
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('All frames sent to server. Waiting for annotated frames...')),
        );
      } else {
        print('Frame extraction failed');
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    _channel?.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record and Send Video Frames'),
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
                angle: 90 * pi / 180,
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                ),
              )
                  : Container(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickVideo,
                child: Text('Record Video'),
              ),
              SizedBox(height: 20),
              _annotatedFrames.isEmpty
                  ? Text('No annotated frames received')
                  : Column(
                children: _annotatedFrames.map((frameData) {
                  return Image.memory(frameData); // Display each annotated frame
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}