import 'package:clip_react/screens/home/components/achievements_badges.dart';
import 'package:clip_react/screens/home/components/progress_line.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF0A0A13);
    const surfaceColor = Color(0xFF171C29);
    const primaryAccent = Color(0xFFE94E77);
    const secondaryAccent = Color(0xFF6C63FF);
    const goldAccent = Color(0xFFF7B733);
    const emeraldAccent = Color(0xFF32D7A3);

    const totalXP = 20000.0;
    const currentXP = 14500.0;
    const progress = currentXP / totalXP;

    const milestones = [0.15, 0.4, 0.65, 1.0];

    final achievements = [
      {
        'title': 'Daily Streak Master',
        'icon': Icons.local_fire_department,
        'unlocked': true,
        'accent': primaryAccent,
      },
      {
        'title': 'Genre Expert',
        'icon': Icons.auto_awesome,
        'unlocked': true,
        'accent': secondaryAccent,
      },
      {
        'title': 'First 100 Correct',
        'icon': Icons.star_rounded,
        'unlocked': true,
        'accent': goldAccent,
      },
      {
        'title': 'Trophy Collector',
        'icon': Icons.emoji_events_rounded,
        'unlocked': true,
        'accent': emeraldAccent,
      },
      {
        'title': 'Perfect Score',
        'icon': Icons.check_circle_rounded,
        'unlocked': true,
        'accent': const Color(0xFF5DD0FF),
      },
      {
        'title': 'Movie Guru',
        'icon': Icons.movie_creation_outlined,
        'unlocked': false,
        'accent': goldAccent,
      },
      {
        'title': 'Weekend Warrior',
        'icon': Icons.weekend_rounded,
        'unlocked': false,
        'accent': primaryAccent,
      },
      {
        'title': 'Champion',
        'icon': Icons.workspace_premium_rounded,
        'unlocked': false,
        'accent': secondaryAccent,
      },
    ];

    final leaderboard = [
      {'name': 'Luna', 'xp': '18.9K', 'rank': '#1', 'accent': goldAccent},
      {
        'name': 'John Doe',
        'xp': '14.5K',
        'rank': '#2',
        'accent': primaryAccent,
      },
      {'name': 'Mason', 'xp': '13.8K', 'rank': '#3', 'accent': secondaryAccent},
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF121726), Color(0xFF090A12)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Clip React',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white12),
                      ),
                      child: const Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: surfaceColor,
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
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: secondaryAccent.withValues(alpha: 0.16),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -18,
                        left: -18,
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryAccent.withValues(alpha: 0.18),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [primaryAccent, secondaryAccent],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: const CircleAvatar(
                                  radius: 34,
                                  backgroundColor: Color(0xFFEEF2FF),
                                  child: Icon(
                                    Icons.person_rounded,
                                    color: Color(0xFF5C6070),
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
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 22),
                          Container(
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
                                      '${currentXP.toInt()} / ${totalXP.toInt()} XP',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  height: 42,
                                  child: ProgressLine(
                                    progress: progress,
                                    milestones: milestones,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
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
                      '5 / ${achievements.length} unlocked',
                      style: const TextStyle(color: Colors.white60),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: achievements.length,
                    itemBuilder: (context, index) {
                      final item = achievements[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: AchievementsBadges(
                          title: item['title'] as String,
                          icon: item['icon'] as IconData,
                          isUnlocked: item['unlocked'] as bool,
                          accent: item['accent'] as Color,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 22),
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
                    color: surfaceColor,
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
                      ...leaderboard.map((entry) {
                        final isCurrentUser = entry['name'] == 'John Doe';

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _LeaderboardTile(
                            name: entry['name'] as String,
                            rank: entry['rank'] as String,
                            xp: entry['xp'] as String,
                            accent: entry['accent'] as Color,
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
                              accent: secondaryAccent,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _InsightCard(
                              title: 'Average Score',
                              value: '8.7/10',
                              icon: Icons.query_stats_rounded,
                              accent: emeraldAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
  final String name;
  final String rank;
  final String xp;
  final Color accent;
  final bool highlighted;

  const _LeaderboardTile({
    required this.name,
    required this.rank,
    required this.xp,
    required this.accent,
    required this.highlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: highlighted
            ? accent.withValues(alpha: 0.14)
            : Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: highlighted ? accent.withValues(alpha: 0.45) : Colors.white10,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.16),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                name.characters.first,
                style: TextStyle(
                  color: accent,
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
                  name,
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
            rank,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 18),
          Text(
            xp,
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
