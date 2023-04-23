import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trinetra/auth/auth.dart';
import 'package:trinetra/homePage.dart';
import 'package:trinetra/introScreens/page1.dart';
import 'package:trinetra/introScreens/page2.dart';
import 'package:trinetra/introScreens/page3.dart';
import 'package:trinetra/screen/signIn.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _controller = PageController();
  bool onLastPage = false;
  bool onFirstPage = true;
  bool isLogged = false;
  AuthClass authClass = AuthClass();

  Future<void> isLog() async {
    SharedPreferences shares = await SharedPreferences.getInstance();
    bool logg = shares.getBool('isLogged') ?? false;
    logg ? isLogged = true : isLogged = false;
  }

  @override
  void initState() {
    super.initState();
    isLog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                onLastPage = value == 2 ? true : false;
                onFirstPage = value == 0 ? true : false;
              });
            },
            children: [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              child: TextButton(
                onPressed: () {
                  _controller.animateToPage(
                    2,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeIn,
                  );
                },
                child: Text(
                  "SKIP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: !onFirstPage
                      ? Text(
                          "BACK",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          "     ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: SwapEffect(
                    dotColor: Colors.deepPurple.shade50,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    onLastPage
                        ? null
                        : _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                  },
                  child: onLastPage
                      ? !isLogged
                          ? Row(
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignIn(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  fillColor: Colors.deepPurple,
                                  focusColor: Colors.deepPurple,
                                  shape: StadiumBorder(),
                                  elevation: 0,
                                  child: Text(
                                    "SIGN IN",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    SharedPreferences shares =
                                        await SharedPreferences.getInstance();

                                    var email = shares.getString('email');
                                    var pwd = shares.getString('pwd');

                                    await authClass.emailSignIn(
                                      context,
                                      email.toString(),
                                      pwd.toString(),
                                    );
                                  },
                                  child: Text(
                                    "NEXT",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 17,
                                )
                              ],
                            )
                      : Row(
                          children: const [
                            Text(
                              "NEXT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 17,
                            )
                          ],
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
