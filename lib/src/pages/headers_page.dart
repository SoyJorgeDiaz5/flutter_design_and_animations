import 'package:flutter/material.dart';

import '../widgets/custom-animations/header_waves_gradient.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HeaderWavesGradient(),
    );
  }
}
