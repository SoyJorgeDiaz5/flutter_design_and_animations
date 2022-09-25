import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {
  const AnimatedSquarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _AnimatedSquare(),
      ),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  const _AnimatedSquare({
    Key? key,
  }) : super(key: key);

  @override
  State<_AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<_AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> translateRight;
  late Animation<double> translateUp;
  late Animation<double> translateLeft;
  late Animation<double> translateDown;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );

    translateRight = Tween(
      begin: 0.0,
      end: 90.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0,
        0.25,
        curve: Curves.bounceOut,
      ),
    ));

    translateUp = Tween(
      begin: 0.0,
      end: -90.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.25,
        0.50,
        curve: Curves.bounceOut,
      ),
    ));

    translateLeft = Tween(
      begin: 0.0,
      end: -90.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.50,
        0.75,
        curve: Curves.bounceOut,
      ),
    ));

    translateDown = Tween(
      begin: 0.0,
      end: 90.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.75,
        1.0,
        curve: Curves.bounceOut,
      ),
    ));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      child: _Square(),
      builder: (context, childSquare) {
        return Transform.translate(
          offset: Offset(
            translateRight.value + translateLeft.value,
            translateUp.value + translateDown.value,
          ),
          child: childSquare
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
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
