import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color backgroundColor;
  final double mainStrokeSize;
  final double backStrokeSize;

  const RadialProgress({
    Key? key,
    required this.percentage,
    this.primaryColor = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.mainStrokeSize = 10,
    this.backStrokeSize = 10,
  }) : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double previousPercentage;

  @override
  void initState() {
    previousPercentage = widget.percentage;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0);

    final valueToAnimate = widget.percentage - previousPercentage;
    previousPercentage = widget.percentage;

    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MyRadialProgress(
                  (widget.percentage - valueToAnimate) +
                      (valueToAnimate * controller.value),
                  widget.primaryColor,
                  widget.backgroundColor,
                  widget.mainStrokeSize,
                  widget.backStrokeSize),
            ),
          );
        });
  }
}

class _MyRadialProgress extends CustomPainter {
  final double percentage;
  final Color primaryColor;
  final Color backgroundColor;
  final double mainStrokeSize;
  final double backStrokeSize;

  _MyRadialProgress(this.percentage, this.primaryColor, this.backgroundColor,
      this.mainStrokeSize, this.backStrokeSize);

  @override
  void paint(Canvas canvas, Size size) {
    
    final Rect rect = Rect.fromCircle(
      center: const Offset(0, 0), 
      radius: 180
    );

    const Gradient gradient = LinearGradient(colors: [
      Color(0xffc012ff),
      Color(0xff6d05e8),
      Colors.red,
    ]);

    // Circle completed
    final paint = Paint()
      ..strokeWidth = backStrokeSize
      ..color = backgroundColor
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arch
    final paintArch = Paint()
      ..strokeWidth = mainStrokeSize
      // ..color = primaryColor
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArch,
    );

    // Circle value reference
    final offset = Offset(
      center.dx + radius * cos(-pi / 2 + arcAngle),
      center.dy + radius * sin(-pi / 2 + arcAngle),
    );

    canvas.drawCircle(
      offset,
      8,
      Paint()
        ..strokeWidth = 5
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
