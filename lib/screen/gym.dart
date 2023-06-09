import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:giff_dialog/giff_dialog.dart';
import 'package:trinetra/abs/bicycle_crunches.dart';
import 'package:trinetra/abs/elbow_plank.dart';
import 'package:trinetra/abs/flutter_kicks.dart';
import 'package:trinetra/abs/leg_rise.dart';
import 'package:trinetra/abs/sit_ups.dart';
import 'package:trinetra/back/superman.dart';
import 'package:trinetra/chest/dumbells.dart';
import 'package:trinetra/chest/plankRotations.dart';
import 'package:trinetra/glutes/donkey_kick.dart';
import 'package:trinetra/glutes/sideLegrRises.dart';
import 'package:trinetra/glutes/squats.dart';
import 'package:trinetra/quads/climber.dart';
import 'package:trinetra/quads/highKnees.dart';
import 'package:trinetra/quads/lunges.dart';
import 'package:trinetra/screen/profile.dart';

class Gym extends StatefulWidget {
  const Gym({super.key});

  @override
  State<Gym> createState() => _GymState();
}

final padd = [30.0, 30.0, 30.0, 30.0, 30.0];

final carousels = [
  'assets/images/situps.jpg',
  'assets/images/lunges.png',
  'assets/images/squats.jpg',
  'assets/images/tricepa.png',
  'assets/images/chest.jpg',
];

final abs_count = [
  'assets/images/situps.png',
  'assets/images/bicycle_crunches.png',
  'assets/images/legrise.png',
  'assets/images/flatterkicks.png',
  'assets/images/elbowplanks.png',
];

final quads_count = [
  'assets/images/lunges1.png',
  'assets/images/highKnees.jpg',
  'assets/images/climbers.jpg',
];

final glutes_count = [
  'assets/images/squats.png',
  'assets/images/donkeykick.png',
  'assets/images/sidelegraise.png',
];

final back_count = [
  'assets/images/superman.jpg',
];

final chest_count = [
  'assets/images/plankroatation.png',
  'assets/images/dumbel.png',
];

class _GymState extends State<Gym> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: AnimatedTextKit(
                  repeatForever: true,
                  pause: Duration(milliseconds: 0),
                  animatedTexts: [
                    RotateAnimatedText(
                      "Situps",
                      duration: Duration(milliseconds: 2100),
                      textAlign: TextAlign.start,
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "font6",
                        color: Colors.deepPurple,
                      ),
                    ),
                    RotateAnimatedText(
                      "Lunges",
                      textAlign: TextAlign.start,
                      duration: Duration(milliseconds: 2100),
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "font6",
                        color: Colors.deepPurple,
                      ),
                    ),
                    RotateAnimatedText(
                      "Squats",
                      textAlign: TextAlign.start,
                      duration: Duration(milliseconds: 2100),
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "font6",
                        color: Colors.deepPurple,
                      ),
                    ),
                    RotateAnimatedText(
                      "Tricepa",
                      duration: Duration(milliseconds: 2100),
                      textAlign: TextAlign.start,
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "font6",
                        color: Colors.deepPurple,
                      ),
                    ),
                    RotateAnimatedText(
                      "Chest",
                      duration: Duration(milliseconds: 2100),
                      textAlign: TextAlign.start,
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "font6",
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  width: 50,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AltarMenu()));
                    },
                    child: Image.asset(
                      'assets/images/male.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 235,
                      child: CarouselSlider.builder(
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return Material(
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: padd[index]),
                                child: Image.asset(
                                  carousels[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: carousels.length,
                        options: CarouselOptions(
                          height: 225,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 2),
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        "Abs",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold,
                          fontFamily: "font6",
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: abs_count.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  index == 0
                                      ? showDialog(
                                          context: context,
                                          builder: (_) => AssetGiffDialog(
                                            title: const Text(
                                              'Sit Ups',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            entryAnimation:
                                                EntryAnimation.bottomRight,
                                            onOkButtonPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SitUps(),
                                                ),
                                              );
                                            },
                                            image: Image.asset(
                                              'assets/images/situps.gif',
                                            ),
                                          ),
                                        )
                                      : index == 1
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Bicycle_crunches(),
                                              ),
                                            )
                                          : index == 2
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LegRise(),
                                                  ),
                                                )
                                              : index == 3
                                                  ? showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          AssetGiffDialog(
                                                        title: const Text(
                                                          'Flutter Kicks',
                                                          style: TextStyle(
                                                            fontSize: 22.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        entryAnimation:
                                                            EntryAnimation
                                                                .bottomRight,
                                                        onOkButtonPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FlutterKicks(),
                                                            ),
                                                          );
                                                        },
                                                        image: Image.asset(
                                                          'assets/images/flatterkicksgif.gif',
                                                        ),
                                                      ),
                                                    )
                                                  : showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          AssetGiffDialog(
                                                        title: const Text(
                                                          'Elbow Plank',
                                                          style: TextStyle(
                                                            fontSize: 22.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        entryAnimation:
                                                            EntryAnimation
                                                                .bottomRight,
                                                        onOkButtonPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ElbowPlank(),
                                                            ),
                                                          );
                                                        },
                                                        image: Image.asset(
                                                          'assets/images/elbowplank.gif',
                                                        ),
                                                      ),
                                                    );
                                },
                                child: Material(
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.deepPurple.shade50,
                                          Colors.deepPurple.shade100,
                                        ],
                                        begin: Alignment.center,
                                        end: Alignment.topRight,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(
                                      abs_count[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        "Quads",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold,
                          fontFamily: "font6",
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: quads_count.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  index == 0
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Lunges(),
                                          ),
                                        )
                                      : index == 1
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HighKnees(),
                                              ),
                                            )
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Climber(),
                                              ),
                                            );
                                },
                                child: Material(
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.deepPurple.shade100,
                                          Colors.deepPurple.shade50,
                                        ],
                                        begin: Alignment.center,
                                        end: Alignment.topRight,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(
                                      quads_count[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        "Glutes",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold,
                          fontFamily: "font6",
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: glutes_count.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  index == 0
                                      ? showDialog(
                                          context: context,
                                          builder: (_) => AssetGiffDialog(
                                            title: const Text(
                                              'Squates',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            entryAnimation:
                                                EntryAnimation.bottomRight,
                                            onOkButtonPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Squates(),
                                                ),
                                              );
                                            },
                                            image: Image.asset(
                                              'assets/images/sqauts.gif',
                                            ),
                                          ),
                                        )
                                      : index == 1
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DonkeyKick(),
                                              ),
                                            )
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SideLegRises(),
                                              ),
                                            );
                                },
                                child: Material(
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.deepPurple.shade50,
                                          Colors.deepPurple.shade100,
                                        ],
                                        begin: Alignment.center,
                                        end: Alignment.topRight,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(
                                      glutes_count[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        "Chest",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold,
                          fontFamily: "font6",
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: chest_count.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  index == 0
                                      ? showDialog(
                                          context: context,
                                          builder: (_) => AssetGiffDialog(
                                            title: const Text(
                                              'Plank Rotation',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            entryAnimation:
                                                EntryAnimation.bottomRight,
                                            onOkButtonPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PlankRotations(),
                                                ),
                                              );
                                            },
                                            image: Image.asset(
                                              'assets/images/PlankRotation.gif',
                                            ),
                                          ),
                                        )
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => dumbells(),
                                          ),
                                        );
                                },
                                child: Material(
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.deepPurple.shade100,
                                          Colors.deepPurple.shade50,
                                        ],
                                        begin: Alignment.center,
                                        end: Alignment.topRight,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: index == 0
                                          ? EdgeInsets.symmetric(horizontal: 0)
                                          : EdgeInsets.symmetric(
                                              horizontal: 50,
                                            ),
                                      child: Image.asset(
                                        chest_count[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        "Back",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold,
                          fontFamily: "font6",
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: back_count.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: GestureDetector(
                                onTap: () {},
                                child: Material(
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.deepPurple.shade50,
                                          Colors.deepPurple.shade100,
                                        ],
                                        begin: Alignment.center,
                                        end: Alignment.topRight,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(
                                      back_count[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
