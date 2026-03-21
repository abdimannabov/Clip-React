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

              // Input box
              Positioned(
                bottom: 80,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  height: 46,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white12, width: 2),
                  ),
                  child: Stack(
                    children: [
                      const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Type your guess ...",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                        ),
                      ),
                      Positioned(
                        right: 3,
                        top: 3,
                        bottom: 3,
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              255,
                              45,
                              44,
                              44,
                            ).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: const Text(
                              "Submit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
