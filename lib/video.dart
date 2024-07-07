import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeVideo() {
    _controller = VideoPlayerController.asset("assets/video1.mp4")
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true);
          _controller.play();
          _isPlaying = true;
        });
      })
      ..addListener(() {
        setState(() {
          if (_controller.value.isPlaying && !_controller.value.isLooping) {
            _controller.play();
          }
        });
      })
      ..setVolume(0.0); // Optionally set volume to 0 if video should be muted
  }

  @override
  Widget build(BuildContext context) {
    return _isPlaying
        ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
        : Container();
  }
}
