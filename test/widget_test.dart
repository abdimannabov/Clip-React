import 'package:clip_react/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('profile screen renders redesigned sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: ProfileScreen(),
      ),
    );

    expect(find.text('Movie Enthusiast'), findsOneWidget);
    expect(find.text('Performance'), findsOneWidget);
    expect(find.text('Quick Access'), findsOneWidget);
  });
}
