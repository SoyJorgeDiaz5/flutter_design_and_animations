import 'package:flutter/material.dart';

import '../widgets/header_circular.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HeaderCircular(),
    );
  }
}