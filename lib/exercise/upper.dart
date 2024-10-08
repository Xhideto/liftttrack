// lib/upper_body_page.dart
import 'package:flutter/material.dart';
import 'package:lifttrack/upperex/bpress.dart';
import 'package:lifttrack/upperex/pcurl.dart';
import 'package:lifttrack/upperex/spress.dart';
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
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BenchPage()),
                );
              },
            ),
            SizedBox(height: 20),
            ExerciseCard(
              title: 'Shoulder Press',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoulderPage())
                );
              },
            ),
            SizedBox(height: 20),
            ExerciseCard(
              title: 'Preacher Curl',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PreacherPage())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
