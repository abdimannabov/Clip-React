import 'package:clip_react/screens/profile/components/performance_section.dart';
import 'package:clip_react/screens/profile/components/profile_hero_card.dart';
import 'package:clip_react/screens/profile/components/profile_streak_card.dart';
import 'package:clip_react/screens/profile/components/profile_top_bar.dart';
import 'package:clip_react/screens/profile/components/quick_access_section.dart';
import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/sign_in_bloc/sign_in_bloc.dart';

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
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.background),
              child: Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            ListTile(leading: Icon(Icons.palette), title: Text('Appearance')),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help & Support'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onPressed: () {
                // Handle log out action
                context.read<SignInBloc>().add(const SignOutRequired());
              },
              child: Text('Log Out', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
