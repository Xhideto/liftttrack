// lib/upperex/bpress.dart
import 'package:flutter/material.dart';
import 'package:lifttrack/cam/cameraS.dart';

class SquatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Squat'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'SQUATS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset('assets/gifs/squat.gif'), // Add your GIF asset
            ),
            SizedBox(height: 20),
            Text(
              'PREPARATION',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Load a barbell on a rack at upper-chest height.Step under the barbell so that it rests on the back of your shoulders, and grasp the bar at each side.Dismount the barbell and step backward carefully. Your feet should be shoulder-width apart and pointing slightly outwards.',
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              'EXECUTION',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Inhale as you squat down by simultaneously pushing your butt backward and bending your knees forward. Keep your torso upright, and descend at least until your knees are bent at a 90-degree angle.\n'
                  '2. Exhale as you push your body back up to the starting position, driving through your heels and keeping your torso upright.\n'
                  '3. Repeat the exercise until you complete your set.',
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              'TIPS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Keep your back straight, torso upright, head up, and feet flat. Keep your knees and feet pointing in the same direction.Practice proper barbell squat form with an unloaded barbell.\n'
                  'Start light and add weight gradually, allowing your legs and lower back to adapt.If lifting heavy, have a spotter ready, or use a squat rack or power rack.',
            ),
            SizedBox(height: 20),
            Text(
              'TARGETED MUSCLES',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Center(
              child: Image.asset('assets/images/sqtmusc.png'), // Add your image asset
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VideoPage())
                  );
                },
                child: Text('Track'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}