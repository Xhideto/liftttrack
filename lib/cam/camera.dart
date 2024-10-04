import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

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
        _controller = VideoPlayerController.file(_videoFile!)
          ..initialize().then((_) {
            setState(() {});
            _controller!.play();
          });
      });
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _videoFile == null
                ? Text('No video recorded')
                : _controller!.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            )
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickVideo,
              child: Text('Record Video'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _extractFrames,
              child: Text('Extract Frames'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadVideo,
              child: Text('Upload Video'),
            ),
            SizedBox(height: 20),
            _frames.isEmpty
                ? Text('No frames extracted')
                : Expanded(
              child: ListView.builder(
                itemCount: _frames.length,
                itemBuilder: (context, index) {
                  return Image.file(_frames[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
