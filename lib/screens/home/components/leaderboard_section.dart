import 'package:clip_react/data/home_data.dart';
import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';

class LeaderboardSection extends StatelessWidget {
  const LeaderboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Leaderboard & Stats',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  SizedBox(width: 12),
                  Expanded(child: _LeaderboardHeader(label: 'Player')),
                  _LeaderboardHeader(label: 'Rank'),
                  SizedBox(width: 18),
                  _LeaderboardHeader(label: 'XP'),
                  SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 14),
              ...leaderboardEntries.map((entry) {
                final isCurrentUser = entry.name == 'John Doe';

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _LeaderboardTile(
                    entry: entry,
                    highlighted: isCurrentUser,
                  ),
                );
              }),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Expanded(
                    child: _InsightCard(
                      title: 'Best Category',
                      value: 'Sci-Fi',
                      icon: Icons.auto_awesome_rounded,
                      accent: AppColors.secondaryAccent,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _InsightCard(
                      title: 'Average Score',
                      value: '8.7/10',
                      icon: Icons.query_stats_rounded,
                      accent: AppColors.emeraldAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LeaderboardHeader extends StatelessWidget {
  final String label;

  const _LeaderboardHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white54,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _LeaderboardTile extends StatelessWidget {
  final LeaderboardEntry entry;
  final bool highlighted;

  const _LeaderboardTile({required this.entry, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: highlighted
            ? entry.accent.withValues(alpha: 0.14)
            : Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: highlighted
              ? entry.accent.withValues(alpha: 0.45)
              : Colors.white10,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: entry.accent.withValues(alpha: 0.16),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                entry.name.characters.first,
                style: TextStyle(
                  color: entry.accent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  highlighted ? 'You are climbing fast' : 'Top contender',
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            entry.rank,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 18),
          Text(
            entry.xp,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color accent;

  const _InsightCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: accent),
          ),
          const SizedBox(height: 18),
          Text(title, style: const TextStyle(color: Colors.white60)),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
