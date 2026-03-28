import 'package:clip_react/core/game/game_logic.dart';
import 'package:flutter/material.dart';

class ClipResultOverlay extends StatelessWidget {
  final GuessEvaluation evaluation;

  const ClipResultOverlay({required this.evaluation, super.key});

  @override
  Widget build(BuildContext context) {
    final accent = switch (evaluation.matchType) {
      GuessMatchType.full => const Color(0xFF2ECC71),
      GuessMatchType.partial => const Color(0xFFF5B041),
      GuessMatchType.incorrect => const Color(0xFFE74C3C),
    };
    final deltaText = evaluation.pointsDelta > 0
        ? '+${evaluation.pointsDelta}'
        : '${evaluation.pointsDelta}';
    final checkpointMessage = evaluation.checkpointUnlocked
        ? 'Checkpoint saved at ${evaluation.checkpointAfter}'
        : (evaluation.checkpointProtected
              ? 'Checkpoint protected at ${evaluation.checkpointAfter}'
              : 'Total score ${evaluation.pointsAfter}');

    return IgnorePointer(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.86),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: accent.withValues(alpha: 0.6), width: 2),
          boxShadow: [
            BoxShadow(
              color: accent.withValues(alpha: 0.22),
              blurRadius: 32,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              switch (evaluation.matchType) {
                GuessMatchType.full => Icons.check_circle,
                GuessMatchType.partial => Icons.stars_rounded,
                GuessMatchType.incorrect => Icons.cancel,
              },
              color: accent,
              size: 56,
            ),
            const SizedBox(height: 14),
            Text(
              switch (evaluation.matchType) {
                GuessMatchType.full => 'Nailed it',
                GuessMatchType.partial => 'Close enough',
                GuessMatchType.incorrect => 'Not quite',
              },
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              deltaText == '0'
                  ? 'Checkpoint saved your points'
                  : evaluation.isPartialMatch
                  ? '$deltaText points for a partial title'
                  : '$deltaText points',
              style: TextStyle(
                color: accent,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Answer: ${evaluation.clip.solution}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              checkpointMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white60, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
