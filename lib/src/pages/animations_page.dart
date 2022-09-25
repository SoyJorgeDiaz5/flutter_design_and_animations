import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SquareAnimated(),
      ),
    );
  }
}

class SquareAnimated extends StatefulWidget {
  const SquareAnimated({Key? key}) : super(key: key);

  @override
  State<SquareAnimated> createState() => _SquareAnimatedState();
}

class _SquareAnimatedState extends State<SquareAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> rightMove;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 2000,
        ));

    rotation = Tween(begin: 0.0, end: 2.0 * math.pi).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    opacity = Tween(
      begin: 0.1,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0,
          0.5,
          curve: Curves.easeOut,
        ),
      ),
    );

    rightMove = Tween(
      begin: 0.0,
      end: 150.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.repeat();

    return AnimatedBuilder(
      animation: animationController,
      child: _Square(),
      builder: (context, childSquare) {
        return Transform.translate(
          offset: Offset(rightMove.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value,
              child: childSquare,
            ),
          ),
        );
      },
    );
  }
}

class _Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
