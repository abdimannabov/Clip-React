import 'package:flutter/material.dart';

class LikeComment extends StatelessWidget {
  const LikeComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Like button
        Column(
          children: const [
            Icon(Icons.favorite, color: Colors.white, size: 36),
            SizedBox(height: 4),
            Text('1.2K', style: TextStyle(color: Colors.white)),
          ],
        ),

        const SizedBox(height: 40),

        // Comment button
        Column(
          children: const [
            Icon(Icons.comment, color: Colors.white, size: 36),
            SizedBox(height: 4),
            Text('345', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
