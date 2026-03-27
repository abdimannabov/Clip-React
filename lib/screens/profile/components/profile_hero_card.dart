import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';

class ProfileHeroCard extends StatelessWidget {
  const ProfileHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 28,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -30,
            right: -10,
            child: _DecorativeCircle(
              size: 120,
              color: AppColors.secondaryAccent.withValues(alpha: 0.18),
            ),
          ),
          Positioned(
            bottom: 10,
            left: -20,
            child: _DecorativeCircle(
              size: 80,
              color: AppColors.primaryAccent.withValues(alpha: 0.16),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _ProfileIdentity(),
              SizedBox(height: 24),
              _ProfileXpCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileIdentity extends StatelessWidget {
  const _ProfileIdentity();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppGradients.avatarRing,
          ),
          child: const CircleAvatar(
            radius: 34,
            backgroundColor: AppColors.avatarBackground,
            child: Icon(
              Icons.person_rounded,
              size: 34,
              color: AppColors.avatarForeground,
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
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '@cinemaoracle',
                style: TextStyle(color: Colors.white60, fontSize: 14),
              ),
              SizedBox(height: 10),
              Text(
                'You are on a hot streak. Keep the momentum going and climb the leaderboard.',
                style: TextStyle(color: Colors.white70, height: 1.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileXpCard extends StatelessWidget {
  const _ProfileXpCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Level 14',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Text(
                '14,500 / 20,000 XP',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.72),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              value: 0.725,
              minHeight: 10,
              backgroundColor: Colors.white.withValues(alpha: 0.08),
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.goldAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorativeCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _DecorativeCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
