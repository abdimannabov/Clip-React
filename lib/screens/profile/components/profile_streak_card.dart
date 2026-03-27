import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';

class ProfileStreakCard extends StatelessWidget {
  const ProfileStreakCard({super.key});

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
      child: const Column(
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
            '5 days in a row with longest 3 correct answers.',
            style: TextStyle(color: Colors.white, height: 1.45),
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _HighlightMetric(
                  value: '5',
                  label: 'Days',
                  icon: Icons.calendar_today_rounded,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _HighlightMetric(
                  value: '3',
                  label: 'Rounds',
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
