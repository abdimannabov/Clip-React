import 'package:clip_react/data/home_data.dart';
import 'package:clip_react/screens/home/components/achievements_badges.dart';
import 'package:flutter/material.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final unlockedCount = homeAchievements
        .where((item) => item.isUnlocked)
        .length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Achievements & Badges',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              '$unlockedCount / ${homeAchievements.length} unlocked',
              style: const TextStyle(color: Colors.white60),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 160,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: homeAchievements.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = homeAchievements[index];

              return AchievementsBadges(
                title: item.title,
                icon: item.icon,
                isUnlocked: item.isUnlocked,
                accent: item.accent,
              );
            },
          ),
        ),
      ],
    );
  }
}
