import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;

  const RadialProgress({Key? key, required this.percentage}) : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${widget.percentage}'),
    );
  }
}
