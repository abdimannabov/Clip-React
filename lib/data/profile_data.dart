import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';

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

const profileStats = [
  ProfileStat(
    value: '120',
    label: 'Correct',
    icon: Icons.check_circle_outline,
    accent: AppColors.primaryAccent,
  ),
  ProfileStat(
    value: '87%',
    label: 'Accuracy',
    icon: Icons.track_changes_rounded,
    accent: AppColors.secondaryAccent,
  ),
  ProfileStat(
    value: '14.5K',
    label: 'XP Earned',
    icon: Icons.bolt_rounded,
    accent: AppColors.goldAccent,
  ),
  ProfileStat(
    value: '24',
    label: 'Rank Boost',
    icon: Icons.trending_up_rounded,
    accent: AppColors.emeraldAccent,
  ),
];

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
