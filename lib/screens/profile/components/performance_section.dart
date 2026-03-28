import 'package:clip_react/data/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

class PerformanceSection extends StatelessWidget {
  final MyUser user;

  const PerformanceSection({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    final stats = buildProfileStats(user);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Performance',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(child: _StatCard(stat: stats[0])),
            const SizedBox(width: 12),
            Expanded(child: _StatCard(stat: stats[1])),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _StatCard(stat: stats[2])),
            const SizedBox(width: 12),
            Expanded(child: _StatCard(stat: stats[3])),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final ProfileStat stat;

  const _StatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: stat.accent.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(stat.icon, color: stat.accent),
          ),
          const SizedBox(height: 18),
          Text(
            stat.value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(stat.label, style: const TextStyle(color: Colors.white60)),
        ],
      ),
    );
  }
}
