import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/svg/mobile_feed.svg'),
      ),
    );
  }
}
