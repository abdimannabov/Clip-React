import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ClipVideo extends StatefulWidget {
  final String path;
  final bool isActive;
  final double horizontalCrop;

  const ClipVideo({
    super.key,
    required this.path,
    required this.isActive,
    this.horizontalCrop = 0,
  });

  @override
  State<ClipVideo> createState() => _ClipVideoState();
}

class _ClipVideoState extends State<ClipVideo> {
  VideoPlayerController? _controller;
  bool _isInitializing = false;

  @override
  void initState() {
    super.initState();
    if (widget.isActive) {
      _initializeController();
    }
  }

  @override
  void didUpdateWidget(covariant ClipVideo oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.path != widget.path) {
      _disposeController();
      if (widget.isActive) {
        _initializeController();
      }
      return;
    }

    if (widget.isActive && _controller == null) {
      _initializeController();
      return;
    }

    if (!widget.isActive && _controller != null) {
      _disposeController();
    }
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  Future<void> _initializeController() async {
    if (_isInitializing || _controller != null) {
      return;
    }

    _isInitializing = true;
    final controller = VideoPlayerController.asset(widget.path);

    try {
      await controller.initialize();
      await controller.setLooping(true);

      if (!mounted || !widget.isActive) {
        await controller.dispose();
        return;
      }

      await controller.play();

      setState(() {
        _controller = controller;
      });
    } catch (_) {
      await controller.dispose();
    } finally {
      _isInitializing = false;
    }
  }

  void _disposeController() {
    final controller = _controller;
    _controller = null;
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final videoSize = controller.value.size;
        final containScale = math.min(
          constraints.maxWidth / videoSize.width,
          constraints.maxHeight / videoSize.height,
        );
        final containedWidth = videoSize.width * containScale;
        final containedHeight = videoSize.height * containScale;
        final maxSafeScale = constraints.maxHeight / containedHeight;
        final requestedScale =
            (containedWidth + (widget.horizontalCrop * 2)) / containedWidth;
        final safeScale = requestedScale.clamp(1.0, maxSafeScale);

        return SizedBox.expand(
          child: ClipRect(
            child: Transform.scale(
              scale: safeScale,
              child: FittedBox(
                fit: BoxFit.contain,
                child: SizedBox(
                  width: videoSize.width,
                  height: videoSize.height,
                  child: VideoPlayer(controller),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
