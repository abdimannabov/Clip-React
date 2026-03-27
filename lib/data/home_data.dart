import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';

class HomeAchievement {
  final String title;
  final IconData icon;
  final bool isUnlocked;
  final Color accent;

  const HomeAchievement({
    required this.title,
    required this.icon,
    required this.isUnlocked,
    required this.accent,
  });
}

class LeaderboardEntry {
  final String name;
  final String xp;
  final String rank;
  final Color accent;

  const LeaderboardEntry({
    required this.name,
    required this.xp,
    required this.rank,
    required this.accent,
  });
}

class HomeStats {
  static const totalXP = 20000.0;
  static const currentXP = 14500.0;
  static const progress = currentXP / totalXP;
  static const milestones = [0.15, 0.4, 0.65, 1.0];
}

const homeAchievements = [
  HomeAchievement(
    title: 'Daily Streak Master',
    icon: Icons.local_fire_department,
    isUnlocked: true,
    accent: AppColors.primaryAccent,
  ),
  HomeAchievement(
    title: 'Genre Expert',
    icon: Icons.auto_awesome,
    isUnlocked: true,
    accent: AppColors.secondaryAccent,
  ),
  HomeAchievement(
    title: 'First 100 Correct',
    icon: Icons.star_rounded,
    isUnlocked: true,
    accent: AppColors.goldAccent,
  ),
  HomeAchievement(
    title: 'Trophy Collector',
    icon: Icons.emoji_events_rounded,
    isUnlocked: true,
    accent: AppColors.emeraldAccent,
  ),
  HomeAchievement(
    title: 'Perfect Score',
    icon: Icons.check_circle_rounded,
    isUnlocked: true,
    accent: AppColors.skyAccent,
  ),
  HomeAchievement(
    title: 'Movie Guru',
    icon: Icons.movie_creation_outlined,
    isUnlocked: false,
    accent: AppColors.goldAccent,
  ),
  HomeAchievement(
    title: 'Weekend Warrior',
    icon: Icons.weekend_rounded,
    isUnlocked: false,
    accent: AppColors.primaryAccent,
  ),
  HomeAchievement(
    title: 'Champion',
    icon: Icons.workspace_premium_rounded,
    isUnlocked: false,
    accent: AppColors.secondaryAccent,
  ),
];

const leaderboardEntries = [
  LeaderboardEntry(
    name: 'Luna',
    xp: '18.9K',
    rank: '#1',
    accent: AppColors.goldAccent,
  ),
  LeaderboardEntry(
    name: 'John Doe',
    xp: '14.5K',
    rank: '#2',
    accent: AppColors.primaryAccent,
  ),
  LeaderboardEntry(
    name: 'Mason',
    xp: '13.8K',
    rank: '#3',
    accent: AppColors.secondaryAccent,
  ),
];
