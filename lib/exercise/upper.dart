// lib/upper_body_page.dart
import 'package:flutter/material.dart';
import 'exercard.dart'; // Import the ExerciseCard

class UpperBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upper Body Exercises'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExerciseCard(
              title: 'Bench Press',
              onTap: () {
                // Navigate to Bench Press details page
              },
            ),
            SizedBox(height: 20),
            ExerciseCard(
              title: 'Shoulder Press',
              onTap: () {
                // Navigate to Shoulder Press details page
              },
            ),
            SizedBox(height: 20),
            ExerciseCard(
              title: 'Preacher Curl',
              onTap: () {
                // Navigate to Preacher Curl details page
              },
            ),
          ],
        ),
      ),
    );
  }
}
