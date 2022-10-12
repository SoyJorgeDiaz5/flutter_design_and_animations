import 'package:flutter/material.dart';

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderTriangularPainter()),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // To draw with path and paint

    // Upper Triangle
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // Bottom Triangle
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);

    // This instruction is optional
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderTriangularPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderTriangularPainter oldDelegate) => false;
}
