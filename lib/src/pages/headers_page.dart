import 'package:flutter/material.dart';

import 'package:design_and_animations/src/widgets/header_waves_gradient.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HeaderWavesGradient(),
    );
  }
}
