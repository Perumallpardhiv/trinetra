import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trinetra/auth/auth.dart';
import 'package:trinetra/screen/signIn.dart';

class AltarMenu extends StatefulWidget {
  AltarMenu({super.key});

  @override
  State<AltarMenu> createState() => _AltarMenuState();
}

class _AltarMenuState extends State<AltarMenu> {
  bool _switchvalue = false;
  AuthClass authh = AuthClass();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: Clip1Clipper(),
            child: Container(
              height: 320,
              color: Colors.deepPurple[200],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        "assets/images/male.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Column(
                  children: [
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(user!.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: Text("Loading ..."));
                        }
                        var details = snapshot.data;
                        return Column(
                          children: [
                            Text(
                              details!['username'] ?? "John",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              details['email'] ?? "abc@gmail.com",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 42,
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: Card(
                      //     elevation: 3,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //         const Padding(
                      //           padding: EdgeInsets.all(8),
                      //           child: Text(
                      //             'Your Friends',
                      //             style: TextStyle(
                      //               color: Color.fromARGB(255, 71, 50, 50),
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.w400,
                      //             ),
                      //           ),
                      //         ),
                      //         IconButton(
                      //           icon: const Icon(
                      //             Icons.arrow_forward_ios,
                      //             size: 20,
                      //           ),
                      //           onPressed: () {},
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          elevation: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Dark Mode',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 71, 50, 50),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Switch(
                                value: _switchvalue,
                                onChanged: (_newvalue) {
                                  setState(() {
                                    _switchvalue = _newvalue;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          elevation: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Share App',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 71, 50, 50),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.share,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                onPressed: () {
                                  Share.share('Check out my app');
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Divider(
                          color: Colors.black,
                          thickness: 0.7,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: () async {
                            authh.logOut();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                              (route) => false,
                            );
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool('isLogged', false);
                          },
                          child: Card(
                            elevation: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 71, 50, 50),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.logout_outlined,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Clip1Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h - h / 16);
    path.quadraticBezierTo(w / 32, h - h / 128, w / 10, h);
    path.lineTo(w - w / 10, h);
    path.quadraticBezierTo(w - w / 32, h - h / 128, w, h - h / 16);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
