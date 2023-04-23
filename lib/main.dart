import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trinetra/auth/auth.dart';
import 'package:trinetra/firebase_options.dart';
import 'package:trinetra/homePage.dart';
import 'package:trinetra/introScreens/splash.dart';
import 'package:trinetra/screen/onBordingScreens.dart';
import 'package:trinetra/screen/signIn.dart';
import 'package:trinetra/screen/signUp.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    super.initState();
    login();
  }

  login() async {
    String mail = "abc@gmail.com";
    String pwd = "123123";
    await authClass.emailSignIn(context, mail.trim(), pwd.trim());
    final user = FirebaseAuth.instance.currentUser;
    print(user!.uid);
    print("done");
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
