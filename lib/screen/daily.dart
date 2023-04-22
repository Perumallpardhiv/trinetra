import 'package:flutter/material.dart';

class DailyStreak extends StatefulWidget {
  const DailyStreak({super.key});

  @override
  State<DailyStreak> createState() => _DailyStreakState();
}

class _DailyStreakState extends State<DailyStreak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: Text("Daily"),
      ),
    );
  }
}
