import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trinetra/auth/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthClass authClass = AuthClass();
  TextEditingController _emailCont = TextEditingController();
  TextEditingController _pwdCont = TextEditingController();
  TextEditingController _conformPwdCont = TextEditingController();
  bool pwd = true;
  bool conf_pwd = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  alignment: Alignment.center,
                  height: size.height,
                  width: size.width,
                  color: Colors.deepPurple[300],
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.12),
                    child: Column(
                      children: [
                        Text(
                          'SIGN UP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Welcome to Trinetra',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * 0.7,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.05),
                            child: SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width - 60,
                              child: TextFormField(
                                autofillHints: [AutofillHints.email],
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailCont,
                                decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 199, 142, 122),
                                  labelText: "Email ...",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      width: 1.5,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      width: 1.5,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width - 60,
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: _pwdCont,
                              obscureText: pwd,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    pwd == true
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.deepPurple,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      pwd = !pwd;
                                    });
                                  },
                                ),
                                labelText: "Password ...",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width - 60,
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: _conformPwdCont,
                              obscureText: conf_pwd,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    conf_pwd == true
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.deepPurple,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      conf_pwd = !conf_pwd;
                                    });
                                  },
                                ),
                                labelText: "Conform Password ...",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (_pwdCont.text.trim() ==
                                  _conformPwdCont.text.trim()) {
                                await authClass.emailSignUp(
                                    context,
                                    _emailCont.text.trim(),
                                    _pwdCont.text.trim());

                                // add user details for profile page
                                var user = FirebaseAuth.instance.currentUser;
                                if (user != null) {
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(user.uid)
                                      .set(
                                    {
                                      'uid': user.uid,
                                      'email': _emailCont.text.trim(),
                                    },
                                  );
                                }
                              } else {
                                final snackbar = SnackBar(
                                    content: Text(
                                        "Your password and confirmation password do not match."));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                              }
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width - 60,
                              child: Card(
                                elevation: 7,
                                color: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                    width: 1.5,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("If you don't have account? "),
                              SizedBox(
                                width: 1,
                              ),
                              GestureDetector(
                                child: Text(
                                  " SignUp ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                " Forgot Password ? ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Or",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await authClass.googleSignIn(context);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                  'assets/images/google1].png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
