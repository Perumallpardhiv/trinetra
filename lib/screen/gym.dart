import 'package:flutter/material.dart';

class Gym extends StatefulWidget {
  const Gym({super.key});

  @override
  State<Gym> createState() => _GymState();
}

class _GymState extends State<Gym> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: Text("Gym"),
      ),
    );
  }
}
