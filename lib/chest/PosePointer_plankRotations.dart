import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:trinetra/translator.dart';
import 'package:trinetra/values.dart';

class PosePointer_PlankRotations extends CustomPainter {
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

  PosePointer_PlankRotations(
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
      final left1 = pose.landmarks[leftpos1]!; //wrist
      final left2 = pose.landmarks[leftpos2]!; //elbow
      final left3 = pose.landmarks[leftpos3]!; //shoulder

      final left4 = pose.landmarks[rightpos1]!; //wrist
      final left5 = pose.landmarks[rightpos2]!; //elbow
      final left6 = pose.landmarks[rightpos3]!; //shoulder

      angle = (atan2(left1.y - left4.y, left1.x - left4.x)) * 180 ~/ PI;
      // angle1 = (atan2(landmark5.y - landmark6.y, landmark5.x - landmark6.x)) *
      //     180 ~/
      //     PI;

      // angler = (atan2(landmark4.y - landmark3.y, landmark4.x - landmark3.x) -
      //         atan2(landmark1.y - landmark3.y, landmark1.x - landmark3.x)) *
      //     180 ~/
      //     PI;
      // angle1r = (atan2(landmark4.y - landmark3.y, landmark4.x - landmark3.x) -
      //         atan2(landmark1.y - landmark3.y, landmark1.x - landmark3.x)) *
      //     180 ~/
      //     PI;

      if (angle < 0) {
        angle = angle + 360;
      }

      if (angler < 0) {
        angler = angler + 360;
      }
      // if (angle > 180) {
      //   angle = 360 - angle;
      // }
      if (angle1 < 0) {
        angle1 = angle1 + 360;
      }
      if (angle1r < 0) {
        angle1r = angle1r + 360;
      }
      // if (angle1 > 180) {
      //   angle1 = 360 - angle1;
      // }
      print("Angle: $angle");
      // print("Angle1: $angle1");
      if (angle > 150 && angle < 200 && stage != "down" && left6.y < left4.y) {
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
      if (angle > 150 && angle < 200 && stage == "down" && left6.y < left4.y) {
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
          translateX(left4.x, rotation, size, absoluteImageSize),
          translateY(left4.y, rotation, size, absoluteImageSize),
        ),
        1,
        dot,
      );

      canvas.drawCircle(
        Offset(
          translateX(left5.x, rotation, size, absoluteImageSize),
          translateY(left5.y, rotation, size, absoluteImageSize),
        ),
        1,
        dot,
      );

      canvas.drawCircle(
        Offset(
          translateX(left6.x, rotation, size, absoluteImageSize),
          translateY(left6.y, rotation, size, absoluteImageSize),
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
  bool shouldRepaint(covariant PosePointer_PlankRotations oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.poses != poses;
  }
}
