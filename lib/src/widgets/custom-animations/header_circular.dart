import 'package:flutter/material.dart';

class HeaderCircular extends StatelessWidget {
  const HeaderCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Color(0xff615aab),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
      ),
    );
  }
}
