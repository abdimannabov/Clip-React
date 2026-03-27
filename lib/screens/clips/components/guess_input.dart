import 'package:flutter/material.dart';

class GuessInput extends StatelessWidget {
  const GuessInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      height: 46,
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white12, width: 2),
      ),
      child: Stack(
        children: [
          const TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Type your guess ...',
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
                color: const Color(0xFF2D2C2C).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Submit',
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
    );
  }
}
