import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trinetra/abs/pointer_legrise.dart';
import 'package:trinetra/values.dart';

import '../camera_view.dart';

class LegRise extends StatefulWidget {
  const LegRise({super.key});

  @override
  State<LegRise> createState() => _LegRiseState();
}

class _LegRiseState extends State<LegRise> {
  PoseDetector poseDetector = GoogleMlKit.vision.poseDetector();
  bool isBusy = false;
  CustomPaint? customPaint;

  Future<void> storeCalories() async {
    print("Calories Counted");
    final prefs = await SharedPreferences.getInstance();
    var calories = prefs.getInt('abs') ?? 0;
    var cal = calories + (counter * 0.3).toInt();
    prefs.setInt('abs', cal);
    print("Counter: $counter \n Calories: $cal");
  }

  @override
  void initState() {
    ResetValue();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await storeCalories();
    await poseDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
        customPaint: customPaint,
        onImage: (inputImage) {
          processImage(inputImage);
        });
  }

  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final poses = await poseDetector.processImage(inputImage);
    final PoseLandmarkType leftpos1 = PoseLandmarkType.leftShoulder;
    final PoseLandmarkType leftpos2 = PoseLandmarkType.leftHip;
    final PoseLandmarkType leftpos3 = PoseLandmarkType.leftAnkle;

    final PoseLandmarkType rightpos1 = PoseLandmarkType.rightShoulder;
    final PoseLandmarkType rightpos2 = PoseLandmarkType.rightHip;
    final PoseLandmarkType rightpos3 = PoseLandmarkType.rightAnkle;

    // final faces = await faceDetector.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = PosePainter_legRise(
        poses,
        inputImage.inputImageData!.size,
        inputImage.inputImageData!.imageRotation,
        85,
        105,
        165,
        180,
        leftpos1,
        leftpos2,
        leftpos3,
        rightpos1,
        rightpos2,
        rightpos3,
      );
      customPaint = CustomPaint(painter: painter);
    } else {
      customPaint = null;
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
