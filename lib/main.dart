import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class FootballStatsHomePage extends StatefulWidget {
  @override
  _FootballStatsHomePageState createState() => _FootballStatsHomePageState();
}

class _FootballStatsHomePageState extends State<FootballStatsHomePage> {
  Map<String, dynamic> _stats = {};

  @override
  void initState() {
    super.initState();
    _fetchStats();
  }

  Future<void> _fetchStats() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/api/stats'));
    if (response.statusCode == 200) {
      setState(() {
        _stats = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load stats');
    }
  }

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
            if (_stats['live_scores'] != null)
              for (var match in _stats['live_scores'])
                Text('${match['match']}: ${match['score']}'),
            SizedBox(height: 32),
            Text(
              'Top Players',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            if (_stats['top_players'] != null)
              for (var player in _stats['top_players'])
                Text('${player['name']} - ${player['goals']} Goals'),
          ],
        ),
      ),
    );
  }
}