import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;

  const RadialProgress({Key? key, required this.percentage}) : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(painter: _MyRadialProgress(widget.percentage),),
    );
  }
}


class _MyRadialProgress extends CustomPainter {
  final double percentage;

  _MyRadialProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    // Circle completed
    final paint = Paint()
      ..strokeWidth = 20
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arch
    final paintArch = Paint()
      ..strokeWidth = 20
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArch,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

