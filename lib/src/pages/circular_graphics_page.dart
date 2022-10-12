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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percentage: percentage, mainColor: Colors.amber,),
              CustomRadialProgress(percentage: percentage, mainColor: Colors.brown,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percentage: percentage, mainColor: Colors.deepOrange),
              CustomRadialProgress(percentage: percentage, mainColor: Colors.pink),
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key? key,
    required this.percentage,
    required this.mainColor,
  }) : super(key: key);

  final double percentage;
  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 170,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: mainColor,
        // backgroundColor: Colors.lightGreen,
        backStrokeSize: 15,
        mainStrokeSize: 20,
      ),
    );
  }
}
