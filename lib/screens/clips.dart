import 'package:clip_react/screens/components/clip_video.dart';
import 'package:clip_react/screens/components/like_comment.dart';
import 'package:flutter/material.dart';

class Clip {
  final String videoPath;
  final List<String> answers;

  Clip({required this.videoPath, required this.answers});
}

final clips = List.generate(
  10,
  (_) => Clip(videoPath: "assets/videos/Clip1.mp4", answers: ["test"]),
);

class ClipsScreen extends StatefulWidget {
  const ClipsScreen({super.key});

  @override
  State<ClipsScreen> createState() => _ClipsScreenState();
}

class _ClipsScreenState extends State<ClipsScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final clips = List.generate(
    10,
    (_) => Clip(videoPath: "assets/videos/Clip1.mp4", answers: ["test"]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.vertical,
        itemCount: clips.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ClipVideo(
                path: clips[index].videoPath,
                isActive: index == currentIndex,
              ),

              Positioned(right: 20, bottom: 160, child: const LikeComment()),

              // overlay (reuse your UI)
              Positioned(
                bottom: 40,
                left: 20,
                child: const Text(
                  "Guess the movie 🎬",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
