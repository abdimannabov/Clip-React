import 'package:flutter/material.dart';

class AchievementsBadges extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isUnlocked;
  final Color accent;

  const AchievementsBadges({
    super.key,
    required this.title,
    required this.icon,
    required this.isUnlocked,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isUnlocked
        ? accent.withValues(alpha: 0.16)
        : Colors.white.withValues(alpha: 0.05);
    final iconColor = isUnlocked ? accent : Colors.white38;
    final titleColor = isUnlocked ? Colors.white : Colors.white60;
    final borderColor = isUnlocked
        ? accent.withValues(alpha: 0.30)
        : Colors.white10;

    return Container(
      width: 122,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: isUnlocked
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  accent.withValues(alpha: 0.22),
                  const Color(0xFF171C29),
                ],
              )
            : null,
        color: isUnlocked ? null : const Color(0xFF171C29),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const Spacer(),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: titleColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                isUnlocked
                    ? Icons.lock_open_rounded
                    : Icons.lock_outline_rounded,
                color: isUnlocked ? accent : Colors.white38,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                isUnlocked ? 'Unlocked' : 'Locked',
                style: TextStyle(
                  color: isUnlocked ? accent : Colors.white38,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
