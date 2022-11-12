import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/slider-model.dart';

enum DotsPosition { up, down }

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final DotsPosition dotsPosition;
  final Color primaryColor;
  final Color backgroundColor;

  const Slideshow({
    Key? key,
    required this.slides,
    this.dotsPosition = DotsPosition.down,
    this.primaryColor = Colors.purple,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => SliderModel(),
        child: Center(
          child: Column(
            children: [
              if (dotsPosition == DotsPosition.up)
                _Dots(
                  quantity: slides.length,
                  primaryColor: primaryColor,
                  backgroundColor: backgroundColor,
                ),
              Expanded(
                child: _Slides(
                  slides: slides,
                ),
              ),
              if (dotsPosition == DotsPosition.down)
                _Dots(
                  quantity: slides.length,
                  primaryColor: primaryColor,
                  backgroundColor: backgroundColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int quantity;
  final Color primaryColor;
  final Color backgroundColor;

  const _Dots({
    Key? key,
    required this.quantity,
    required this.primaryColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          quantity,
          (index) => _Dot(
            index: index,
            primaryColor: primaryColor,
            backgroundColor: backgroundColor,
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color primaryColor;
  final Color backgroundColor;

  const _Dot({
    Key? key,
    required this.index,
    required this.primaryColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? primaryColor
            : backgroundColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({
    Key? key,
    required this.slides,
  }) : super(key: key);

  final List<Widget> slides;

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();
  final double defaultPagePosition = 0;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page ?? defaultPagePosition;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((item) => _Slide(slide: item)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.slide,
  }) : super(key: key);

  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}
