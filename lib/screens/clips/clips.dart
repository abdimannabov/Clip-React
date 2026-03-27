import 'package:clip_react/data/clip_data.dart';
import 'package:clip_react/screens/clips/components/clip_prompt.dart';
import 'package:clip_react/screens/clips/components/clip_video.dart';
import 'package:clip_react/screens/clips/components/guess_input.dart';
import 'package:clip_react/screens/clips/components/like_comment.dart';
import 'package:flutter/material.dart';

class ClipsScreen extends StatefulWidget {
  const ClipsScreen({super.key});

  @override
  State<ClipsScreen> createState() => _ClipsScreenState();
}

class _ClipsScreenState extends State<ClipsScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.vertical,
        itemCount: sampleClips.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final clip = sampleClips[index];

          return Stack(
            children: [
              ClipVideo(path: clip.videoPath, isActive: index == currentIndex),
              const Positioned(right: 20, bottom: 160, child: LikeComment()),
              const Positioned(bottom: 40, left: 20, child: ClipPrompt()),
              const Positioned(bottom: 80, right: 20, child: GuessInput()),
            ],
          );
        },
      ),
    );
  }
}
