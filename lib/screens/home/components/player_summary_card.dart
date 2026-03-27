import 'package:clip_react/data/home_data.dart';
import 'package:clip_react/screens/home/components/progress_line.dart';
import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';

class PlayerSummaryCard extends StatelessWidget {
  const PlayerSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 24,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -36,
            right: -8,
            child: _DecorativeCircle(
              size: 130,
              color: AppColors.secondaryAccent.withValues(alpha: 0.16),
            ),
          ),
          Positioned(
            bottom: -18,
            left: -18,
            child: _DecorativeCircle(
              size: 90,
              color: AppColors.primaryAccent.withValues(alpha: 0.18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _PlayerIdentity(),
              SizedBox(height: 22),
              _XPCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class _PlayerIdentity extends StatelessWidget {
  const _PlayerIdentity();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            gradient: AppGradients.avatarRing,
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            radius: 34,
            backgroundColor: AppColors.avatarBackground,
            child: Icon(
              Icons.person_rounded,
              color: AppColors.avatarForeground,
              size: 34,
            ),
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Level 14 Cinephile',
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.goldAccent.withValues(alpha: 0.16),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.bolt_rounded, color: AppColors.goldAccent, size: 18),
              SizedBox(width: 6),
              Text(
                '2nd Place',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _XPCard extends StatelessWidget {
  const _XPCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'XP Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '${HomeStats.currentXP.toInt()} / ${HomeStats.totalXP.toInt()} XP',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          SizedBox(height: 16),
          const SizedBox(
            height: 42,
            child: ProgressLine(
              progress: HomeStats.progress,
              milestones: HomeStats.milestones,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: _MiniStat(
                  value: '+1.2K',
                  label: 'This Week',
                  accent: AppColors.secondaryAccent,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MiniStat(
                  value: '87%',
                  label: 'Accuracy',
                  accent: AppColors.emeraldAccent,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MiniStat(
                  value: '5',
                  label: 'Day Streak',
                  accent: AppColors.goldAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String value;
  final String label;
  final Color accent;

  const _MiniStat({
    required this.value,
    required this.label,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _DecorativeCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _DecorativeCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
