import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_stats_app/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(FootballStatsApp());
    expect(find.text('Football Stats'), findsOneWidget);
  });
}