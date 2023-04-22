import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trinetra/auth/auth.dart';
import 'package:trinetra/screen/daily.dart';
import 'package:trinetra/screen/gym.dart';
import 'package:trinetra/screen/yoga.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  var index = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  final items = <Widget>[
    Icon(Icons.stacked_bar_chart_outlined),
    Icon(Icons.fitness_center),
    Icon(Icons.sports_gymnastics_outlined),
  ];

  final screens = [
    DailyStreak(),
    Gym(),
    Yoga(),
  ];

  // final navigationState = navigationKey.currentState;
  // navigationState!.setPage(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: Colors.deepPurple.shade400,
          buttonBackgroundColor: Colors.deepPurple.shade300,
          items: items,
          height: 60,
          backgroundColor: Colors.transparent,
          index: index,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
      ),
    );
  }
}
