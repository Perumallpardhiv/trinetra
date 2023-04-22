import 'package:flutter/material.dart';

class Yoga extends StatefulWidget {
  const Yoga({super.key});

  @override
  State<Yoga> createState() => _YogaState();
}

final yoga = [
  'assets/images/situps.jpg',
  'assets/images/situps.jpg',
  'assets/images/situps.jpg',
  'assets/images/situps.jpg',
  'assets/images/situps.jpg',
];

class _YogaState extends State<Yoga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            children: [
              Text(
                "YOGA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "font6",
                  color: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: yoga.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Material(
                          borderRadius: BorderRadius.circular(50),
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.deepPurple.shade100,
                                  Colors.deepPurple.shade200,
                                ],
                                begin: Alignment.center,
                                end: Alignment.topRight,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Image.asset(yoga[index]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
