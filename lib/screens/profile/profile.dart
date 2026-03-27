import 'package:clip_react/screens/profile/components/performance_section.dart';
import 'package:clip_react/screens/profile/components/profile_hero_card.dart';
import 'package:clip_react/screens/profile/components/profile_streak_card.dart';
import 'package:clip_react/screens/profile/components/profile_top_bar.dart';
import 'package:clip_react/screens/profile/components/quick_access_section.dart';
import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.profileBackground,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: AppSpacing.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ProfileTopBar(),
                AppSpacing.sectionGap,
                ProfileHeroCard(),
                AppSpacing.sectionGap,
                ProfileStreakCard(),
                AppSpacing.sectionGap,
                PerformanceSection(),
                AppSpacing.sectionGap,
                QuickAccessSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
