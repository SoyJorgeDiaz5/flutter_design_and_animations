import 'package:flutter/material.dart';

import '../widgets/progress-bar/radial_progress.dart';

class CircularGraphicsPage extends StatefulWidget {
  const CircularGraphicsPage({Key? key}) : super(key: key);

  @override
  State<CircularGraphicsPage> createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {
  double percentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percentage += 10;

            if (percentage > 100) {
              percentage = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          child: const RadialProgress(percentage: 40),
        ),
      ),
    );
  }
}
