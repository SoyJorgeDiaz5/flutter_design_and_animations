import 'package:flutter/material.dart';

import 'package:design_and_animations/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        slides: [
          SvgPicture.asset('assets/svg/mobile_feed.svg'),
          SvgPicture.asset('assets/svg/mobile_ux.svg'),
          SvgPicture.asset('assets/svg/online_world.svg'),
        ],
      ),
    );
  }
}
