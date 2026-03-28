import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

class ProfileStat {
  final String value;
  final String label;
  final IconData icon;
  final Color accent;

  const ProfileStat({
    required this.value,
    required this.label,
    required this.icon,
    required this.accent,
  });
}

class QuickAccessItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color accent;

  const QuickAccessItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accent,
  });
}

List<ProfileStat> buildProfileStats(MyUser user) {
  return [
    ProfileStat(
      value: '${user.correctGuesses}',
      label: 'Correct',
      icon: Icons.check_circle_outline,
      accent: AppColors.primaryAccent,
    ),
    ProfileStat(
      value: '${(user.accuracy * 100).round()}%',
      label: 'Accuracy',
      icon: Icons.track_changes_rounded,
      accent: AppColors.secondaryAccent,
    ),
    ProfileStat(
      value: '${user.points}',
      label: 'XP Earned',
      icon: Icons.bolt_rounded,
      accent: AppColors.goldAccent,
    ),
    ProfileStat(
      value: '${user.checkpoint}',
      label: 'Safe Zone',
      icon: Icons.security_rounded,
      accent: AppColors.emeraldAccent,
    ),
  ];
}

const quickAccessItems = [
  QuickAccessItem(
    icon: Icons.workspace_premium_rounded,
    title: 'Achievements',
    subtitle: '15 unlocked badges and milestone rewards',
    accent: AppColors.goldAccent,
  ),
  QuickAccessItem(
    icon: Icons.history_rounded,
    title: 'Activity History',
    subtitle: 'Review previous guesses and recent sessions',
    accent: AppColors.secondaryAccent,
  ),
];
