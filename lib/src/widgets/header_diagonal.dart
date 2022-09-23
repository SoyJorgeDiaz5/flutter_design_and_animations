import 'package:flutter/material.dart';

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderDiagonalPainter()),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // To draw with path and paint
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // This instruction is optional
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderDiagonalPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderDiagonalPainter oldDelegate) => false;
}
