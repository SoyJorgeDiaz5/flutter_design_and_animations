import 'package:flutter/material.dart';

class HeaderCurve extends StatelessWidget {
  const HeaderCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderCurvePainter()),
    );
  }
}

class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // To draw with path and paint

    // Curve down
    // path.lineTo(0, size.height * 0.20);
    // path.quadraticBezierTo(size.width * 0.5, size.height * 0.4, size.width, size.height * 0.20);
    // path.lineTo(size.width, 0);

    // Curve up
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.2, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);

    // This instruction is optional
    // path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderCurvePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderCurvePainter oldDelegate) => false;
}
