import 'package:flutter/material.dart';
import 'package:lifttrack/exercise/exercard.dart';
import 'package:lifttrack/exercise/lower.dart';
import 'package:lifttrack/exercise/upper.dart';

class ExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EXERCISES'),
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExerciseCard(
              title: 'UPPER',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpperBodyPage()),
                );
              },
            ),
            SizedBox(height: 20),
            ExerciseCard(
              title: 'LOWER',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LowerBodyPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
