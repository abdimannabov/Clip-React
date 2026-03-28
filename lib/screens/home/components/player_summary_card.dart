import 'package:clip_react/screens/home/components/progress_line.dart';
import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

class PlayerSummaryCard extends StatelessWidget {
  final MyUser user;

  const PlayerSummaryCard({required this.user, super.key});

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
            children: [
              _PlayerIdentity(user: user),
              SizedBox(height: 22),
              _XPCard(user: user),
            ],
          ),
        ],
      ),
    );
  }
}

class _PlayerIdentity extends StatelessWidget {
  final MyUser user;

  const _PlayerIdentity({required this.user});

  @override
  Widget build(BuildContext context) {
    final displayName = user.name.trim().isEmpty ? 'Player One' : user.name;
    final levelLabel = 'Level ${user.level} Cinephile';

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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                displayName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                levelLabel,
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _XPCard extends StatelessWidget {
  final MyUser user;

  const _XPCard({required this.user});

  @override
  Widget build(BuildContext context) {
    final accuracy = '${(user.accuracy * 100).round()}%';

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
              Text(
                'Level ${user.level} Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '${user.points} / ${user.nextLevelTarget} XP',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 42,
            child: ProgressLine(
              progress: user.levelProgress,
              milestones: const [0.25, 0.5, 0.75, 1.0],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _MiniStat(
                  value: '${user.checkpoint}',
                  label: 'Safe Zone',
                  accent: AppColors.primaryAccent,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MiniStat(
                  value: accuracy,
                  label: 'Accuracy',
                  accent: AppColors.emeraldAccent,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MiniStat(
                  value: '${user.streak}',
                  label: 'Hot Streak',
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
