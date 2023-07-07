import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:trinetra/screen/onBordingScreens.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int count = 0;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 1.0, end: 0.7).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.addListener(() {
      count++;
      setState(() {});

      _animationController.isCompleted
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OnBoarding(),
            ),
          )
        : null;
    });

    Timer(
      Duration(milliseconds: 2800),
      () => _animationController.forward(from: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Hero(
          tag: "hero",
          child: Transform.scale(
            scale: _animation.value,
            child: AnimatedTextKit(
              isRepeatingAnimation: true,
              totalRepeatCount: 1,
              animatedTexts: [
                TyperAnimatedText(
                  "TRINETRA",
                  speed: Duration(milliseconds: 150),
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    fontFamily: "font1",
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
