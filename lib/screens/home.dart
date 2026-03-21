import 'package:clip_react/screens/components/achievements_badges.dart';
import 'package:clip_react/screens/components/progress_line.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double totalXP = 20000;
    double currentXP = 14500;
    double progress = currentXP / totalXP;

    List<double> milestones = [0.1, 0.4, 0.7, 1.0];

    final achievements = [
      {"title": "Daily Streak Master", "icon": Icons.local_fire_department},
      {"title": "Genre Expert: Sci-Fi", "icon": Icons.auto_awesome},
      {"title": "First 100 Correct", "icon": Icons.star},
      {"title": "Trophy Collector", "icon": Icons.emoji_events},

      {"title": "Speed Runner", "icon": Icons.flash_on},
      {"title": "Perfect Score", "icon": Icons.check_circle},
      {"title": "Movie Guru", "icon": Icons.movie},
      {"title": "Quiz Beginner", "icon": Icons.school},

      {"title": "Level Up!", "icon": Icons.trending_up},
      {"title": "Night Player", "icon": Icons.nightlight_round},
      {"title": "Weekend Warrior", "icon": Icons.weekend},
      {"title": "Comeback King", "icon": Icons.replay},

      {"title": "Sharpshooter", "icon": Icons.gps_fixed},
      {"title": "Brainiac", "icon": Icons.psychology},
      {"title": "Lucky Guess", "icon": Icons.casino},
      {"title": "Unstoppable", "icon": Icons.whatshot},

      {"title": "Explorer", "icon": Icons.explore},
      {"title": "Collector Lv.2", "icon": Icons.inventory},
      {"title": "Time Master", "icon": Icons.timer},
      {"title": "Champion", "icon": Icons.workspace_premium},
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 10, 19),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Title
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 32, 36, 46),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Center(
                    child: Text(
                      'Clip React',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Player XP banner
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 240,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 32, 36, 46),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Player image
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=3',
                    ), // Placeholder image
                  ),
                  const SizedBox(height: 10),

                  // Player name
                  const Center(
                    child: Text(
                      'Player Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  Column(
                    children: [
                      // Player XP progress bar
                      SizedBox(
                        height: 40,
                        child: ProgressLine(
                          progress: progress,
                          milestones: milestones,
                        ),
                      ),
                      Text(
                        '${currentXP.toInt()} / ${totalXP.toInt()} XP',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),

            // Achievements and badges
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Achievements & Badges',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: achievements.length,
                      itemBuilder: (context, index) {
                        final item = achievements[index];

                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: AchievementsBadges(
                            title: item["title"] as String,
                            icon: item["icon"] as IconData,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Leaderboard and stats
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 32, 36, 46),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Leaderboard & Stats (Coming Soon)',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
