import 'package:flutter/material.dart';

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
        child: Text(
          '$percentage %',
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}