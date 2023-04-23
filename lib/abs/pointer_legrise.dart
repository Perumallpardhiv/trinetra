import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:trinetra/translator.dart';

var angle;
var angle1;
var angler;
var angle1r;
var counter = 0;
bool align = false;
String stage = "up";

void ResetValue() {
  angle = 0;
  angle1 = 0;
  angler = 0;
  angle1r = 0;
  counter = 0;
  align = false;
  stage = "up";
}

class PosePainter_legRise extends CustomPainter {
  final List<Pose> poses;
  final Size absoluteImageSize;
  final InputImageRotation rotation;
  final int minangle;
  final int minangle2;
  final int maxangle;
  final int maxangle2;
  final PoseLandmarkType leftpos1;
  final PoseLandmarkType leftpos2;
  final PoseLandmarkType leftpos3;
  final PoseLandmarkType rightpos1;
  final PoseLandmarkType rightpos2;
  final PoseLandmarkType rightpos3;

  PosePainter_legRise(
    this.poses,
    this.absoluteImageSize,
    this.rotation,
    this.minangle,
    this.minangle2,
    this.maxangle,
    this.maxangle2,
    this.leftpos1,
    this.leftpos2,
    this.leftpos3,
    this.rightpos1,
    this.rightpos2,
    this.rightpos3,
  );

  @override
  void paint(Canvas canvas, Size size) {
    const double PI = 3.141592653589793238;
    Color color;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;
    final dot = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0
      ..color = Colors.yellow;

    for (var pose in poses) {
      final left1 = pose.landmarks[leftpos1]!; //hip
      final left2 = pose.landmarks[leftpos2]!; //knee
      final left3 = pose.landmarks[leftpos3]!; //ankle

      final right1 = pose.landmarks[rightpos1]!; //hip
      final right2 = pose.landmarks[rightpos2]!; //knee
      final right3 = pose.landmarks[rightpos3]!; //ankle

      angle = (atan2(left3.y - left1.y, left3.x - left1.x)) * 180 ~/ PI;

      angle1 = (atan2(right3.y - right1.y, right3.x - right1.x)) * 180 ~/ PI;

      if (angle < 0) {
        print("Added 360");
        angle = angle + 360;
      }

      if (angler < 0) {
        print("Added 360");
        angler = angler + 360;
      }

      if (angle1 < 0) {
        print("Added 360");
        angle1 = angle1 + 360;
      }

      if (angle1r < 0) {
        print("Added 360");
        angle1r = angle1r + 360;
      }

      print("Angle: $angle");
      print("Angle1: $angle1");

      if ((angle > 0 && angle < 40 && stage != "down") &&
          (angle1 > 0 && angle1 < 40 && stage != "down") &&
          (angle == angle1)) {
        stage = "down";
        color = Colors.green;
      }
      if (stage == "down") {
        color = Colors.green;
        align = true;
      } else {
        color = Colors.deepPurple;
        align = false;
      }
      if ((angle > 65 && angle < 105 && stage == "down") &&
          (angle1 > 65 && angle1 < 105 && stage == "down") && (angle == angle1)) {
        counter++;
        stage = "up";
      }

      canvas.drawCircle(
        Offset(
          translateX(left1.x, rotation, size, absoluteImageSize),
          translateY(left1.y, rotation, size, absoluteImageSize),
        ),
        1,
        dot,
      );

      canvas.drawCircle(
        Offset(
          translateX(left2.x, rotation, size, absoluteImageSize),
          translateY(left2.y, rotation, size, absoluteImageSize),
        ),
        1,
        dot,
      );

      canvas.drawCircle(
        Offset(
          translateX(left3.x, rotation, size, absoluteImageSize),
          translateY(left3.y, rotation, size, absoluteImageSize),
        ),
        1,
        dot,
      );

      canvas.drawCircle(
        Offset(
          translateX(right1.x, rotation, size, absoluteImageSize),
          translateY(right1.y, rotation, size, absoluteImageSize),
        ),
        1,
        dot,
      );

      canvas.drawCircle(
        Offset(
          translateX(right2.x, rotation, size, absoluteImageSize),
          translateY(right2.y, rotation, size, absoluteImageSize),
        ),
        1,
        dot,
      );

      canvas.drawCircle(
        Offset(
          translateX(right3.x, rotation, size, absoluteImageSize),
          translateY(right3.y, rotation, size, absoluteImageSize),
        ),
        1,
        dot,
      );

      void paintLine(
          PoseLandmarkType type1, PoseLandmarkType type2, Paint paintType) {
        PoseLandmark joint1 = pose.landmarks[type1]!;
        PoseLandmark joint2 = pose.landmarks[type2]!;
        canvas.drawLine(
          Offset(translateX(joint1.x, rotation, size, absoluteImageSize),
              translateY(joint1.y, rotation, size, absoluteImageSize)),
          Offset(translateX(joint2.x, rotation, size, absoluteImageSize),
              translateY(joint2.y, rotation, size, absoluteImageSize)),
          paintType,
        );
      }

      //Draw arms
      paintLine(leftpos1, leftpos2, paint..color = color);
      paintLine(leftpos2, leftpos3, paint);
      paintLine(rightpos1, rightpos2, paint..color = color);
      paintLine(rightpos2, rightpos3, paint);
    }
  }

  @override
  bool shouldRepaint(covariant PosePainter_legRise oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.poses != poses;
  }
}
