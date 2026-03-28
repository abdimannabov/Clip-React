import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';

class ProfileTopBar extends StatelessWidget {
  const ProfileTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.white12),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.local_fire_department,
                color: AppColors.goldAccent,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Movie Enthusiast',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white12),
          ),
          child: IconButton(
            icon: const Icon(Icons.tune_rounded, color: Colors.white),
            onPressed: () {
              // Opens drawer for preferences/settings
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ],
    );
  }
}
