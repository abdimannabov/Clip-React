import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ClipVideo extends StatefulWidget {
  final String path;
  final bool isActive;

  const ClipVideo({super.key, required this.path, required this.isActive});

  @override
  State<ClipVideo> createState() => _ClipVideoState();
}

class _ClipVideoState extends State<ClipVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.path)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        if (widget.isActive) _controller.play();
      });
  }

  @override
  void didUpdateWidget(covariant ClipVideo oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isActive) {
      _controller.play();
    } else {
      _controller.pause();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}
