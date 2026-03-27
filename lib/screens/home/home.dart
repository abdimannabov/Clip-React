import 'package:clip_react/screens/home/components/achievements_section.dart';
import 'package:clip_react/screens/home/components/home_header.dart';
import 'package:clip_react/screens/home/components/leaderboard_section.dart';
import 'package:clip_react/screens/home/components/player_summary_card.dart';
import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.background),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: AppSpacing.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HomeHeader(),
                AppSpacing.sectionGap,
                PlayerSummaryCard(),
                AppSpacing.sectionGap,
                AchievementsSection(),
                AppSpacing.sectionGap,
                LeaderboardSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
