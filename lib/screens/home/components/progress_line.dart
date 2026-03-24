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
        final width = constraints.maxWidth;

        return Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 10,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            Container(
              height: 10,
              width: width * progress.clamp(0.0, 1.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE94E77), Color(0xFFF7B733)],
                ),
                borderRadius: BorderRadius.circular(999),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x40E94E77),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
            ...milestones.map((milestone) {
              final position = (width * milestone).clamp(12.0, width - 12.0);
              final reached = progress >= milestone;

              return Positioned(
                left: position - 12,
                child: Column(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: reached
                            ? const Color(0xFFF7B733)
                            : Colors.white.withValues(alpha: 0.12),
                        border: Border.all(
                          color: reached
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.18),
                          width: 2,
                        ),
                        boxShadow: reached
                            ? const [
                                BoxShadow(
                                  color: Color(0x55F7B733),
                                  blurRadius: 12,
                                  offset: Offset(0, 4),
                                ),
                              ]
                            : const [],
                      ),
                      child: Icon(
                        reached
                            ? Icons.star_rounded
                            : Icons.lock_outline_rounded,
                        size: 12,
                        color: reached
                            ? const Color(0xFF171C29)
                            : Colors.white54,
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
