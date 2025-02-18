import 'package:flutter/material.dart';

void main() {
  runApp(FootballStatsApp());
}

class FootballStatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Stats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FootballStatsHomePage(),
    );
  }
}

class FootballStatsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Football Stats'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Live Scores',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Match 1: Team A 2 - 1 Team B'),
            Text('Match 2: Team C 0 - 0 Team D'),
            SizedBox(height: 32),
            Text(
              'Top Players',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('1. Player X - 10 Goals'),
            Text('2. Player Y - 8 Goals'),
            Text('3. Player Z - 7 Goals'),
          ],
        ),
      ),
    );
  }
}