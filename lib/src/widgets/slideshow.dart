import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/slider-model.dart';

import 'package:flutter_svg/svg.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child: Center(
        child: Column(
          children: const [
            Expanded(
              child: _Slides(),
            ),
            _Dots(),
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({
    Key? key,
    required this.index,
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
            ? Colors.purple
            : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key}) : super(key: key);

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
      children: const [
        _Slide(svg: 'assets/svg/mobile_feed.svg'),
        _Slide(svg: 'assets/svg/mobile_ux.svg'),
        _Slide(svg: 'assets/svg/online_world.svg'),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.svg,
  }) : super(key: key);

  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
