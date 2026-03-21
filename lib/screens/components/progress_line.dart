import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    super.key,
    required this.progress,
    required this.milestones,
  });

  final double progress;
  final List<double> milestones;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth - 60;

        return Stack(
          alignment: Alignment.centerLeft,
          children: [
            // Background line
            Container(
              height: 6,
              width: width,
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // Progress line
            Container(
              height: 6,
              width: width * progress,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.purple, Colors.blue]),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // Milestones
            ...milestones.map((m) {
              double position = width * m;

              bool reached = progress >= m;

              return Positioned(
                left: position - 8,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: reached ? Colors.white : Colors.grey,
                    shape: BoxShape.circle,
                    boxShadow: reached
                        ? [
                            BoxShadow(
                              color: Colors.blueAccent.withOpacity(0.8),
                              blurRadius: 8,
                            ),
                          ]
                        : [],
                  ),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
