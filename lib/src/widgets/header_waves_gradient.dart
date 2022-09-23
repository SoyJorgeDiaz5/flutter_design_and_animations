import 'package:flutter/material.dart';

class HeaderWavesGradient extends StatelessWidget {
  const HeaderWavesGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWavesGradientPainter()),
    );
  }
}

class _HeaderWavesGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: const Offset(0, 200),
      radius: 180,
    );

    const Gradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff6D05E8),
          Color(0XFFC012FF),
          Color(0xFF6D05FA),
        ],
        stops: [
          0.1,
          0.5,
          1,
        ]);

    final paint = Paint()..shader = gradient.createShader(rect);

    // Properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // To draw with path and paint

    // Curve down
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.3);

    // Curve up
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);

    // This instruction is optional
    // path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderWavesGradientPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderWavesGradientPainter oldDelegate) => false;
}
