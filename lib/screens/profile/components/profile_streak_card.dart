import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

class ProfileStreakCard extends StatelessWidget {
  final MyUser user;

  const ProfileStreakCard({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppGradients.accent,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40E94E77),
            blurRadius: 24,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Win Streak',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'You are ${user.streak} correct answers deep. Best run so far: ${user.bestStreak}.',
            style: TextStyle(color: Colors.white, height: 1.45),
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _HighlightMetric(
                  value: '${user.streak}',
                  label: 'Current',
                  icon: Icons.local_fire_department_rounded,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _HighlightMetric(
                  value: '${user.bestStreak}',
                  label: 'Best',
                  icon: Icons.emoji_events_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HighlightMetric extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _HighlightMetric({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(label, style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }
}
