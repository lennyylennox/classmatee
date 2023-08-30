import 'package:flutter/material.dart';

class Timetable extends StatelessWidget {
  const Timetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          // -- BUTTON
          width: 100,
          child: ElevatedButton(
            onPressed: () {
              CircularProgressIndicator(
                color: Colors.black,
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              overlayColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text(
              "generate".toUpperCase(),
            ),
          ),
        ),
      ),
    );
  }
}
