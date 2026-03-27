import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF0A0A13);
  static const backgroundTop = Color(0xFF121726);
  static const backgroundBottom = Color(0xFF090A12);
  static const profileBackgroundTop = Color(0xFF111524);
  static const surface = Color(0xFF171C29);
  static const primaryAccent = Color(0xFFE94E77);
  static const secondaryAccent = Color(0xFF6C63FF);
  static const goldAccent = Color(0xFFF7B733);
  static const emeraldAccent = Color(0xFF32D7A3);
  static const skyAccent = Color(0xFF5DD0FF);
  static const avatarBackground = Color(0xFFEEF2FF);
  static const avatarForeground = Color(0xFF5C6070);
}

class AppGradients {
  static const background = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.backgroundTop, AppColors.backgroundBottom],
  );

  static const profileBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.profileBackgroundTop, AppColors.backgroundBottom],
  );

  static const accent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primaryAccent, AppColors.goldAccent],
  );

  static const avatarRing = LinearGradient(
    colors: [AppColors.primaryAccent, AppColors.secondaryAccent],
  );
}

class AppSpacing {
  static const screenPadding = EdgeInsets.fromLTRB(20, 16, 20, 28);
  static const sectionGap = SizedBox(height: 22);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.white,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: Colors.black, size: 28);
          }
          return const IconThemeData(color: Colors.grey, size: 28);
        }),
      ),
    );
  }
}
