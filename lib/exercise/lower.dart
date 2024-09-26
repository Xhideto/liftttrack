// lib/lower_body_page.dart
import 'package:flutter/material.dart';
import 'exercard.dart'; // Import the ExerciseCard

class LowerBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lower Body Exercises'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExerciseCard(
              title: 'RDL',
              onTap: () {
                // Navigate to RDL details page
              },
            ),
            SizedBox(height: 20),
            ExerciseCard(
              title: 'Squat',
              onTap: () {
                // Navigate to Squat details page
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}