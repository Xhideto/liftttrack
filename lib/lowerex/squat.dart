// lib/upperex/bpress.dart
import 'package:flutter/material.dart';

class SquatPage extends StatelessWidget {
  const SquatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQUATS', style: TextStyle(color: Colors.white)), // White text
        backgroundColor: Colors.deepOrange.shade400,
        elevation: 3,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'SQUATS',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange[600],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Image.asset('assets/gifs/squat.gif'), // Add your GIF asset
            ),
            const SizedBox(height: 50),
            Text(
              'PREPARATION',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.amber[800], // Text color
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '     Load a barbell on a rack at upper-chest height. Step under the barbell so that it rests on the back of your shoulders, and grasp the bar at each side. '
                  'Dismount the barbell and step backward carefully. Your feet should be shoulder-width apart and pointing slightly outwards.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black, // Text color
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'EXECUTION',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.amber[800], // Text color
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '1. Inhale as you squat down by simultaneously pushing your butt backward and bending your knees forward. Keep your torso upright, and descend at least until your knees are bent at a 90-degree angle.\n\n'
                  '2. Exhale as you push your body back up to the starting position, driving through your heels and keeping your torso upright.\n\n'
                  '3. Repeat the exercise until you complete your set.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black, // Text color
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 50),
            Text(
              'TIPS',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.amber[800], // Text color
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Keep your back straight, torso upright, head up, and feet flat. Keep your knees and feet pointing in the same direction.Practice proper barbell squat form with an unloaded barbell.\n'
                  'Start light and add weight gradually, allowing your legs and lower back to adapt.If lifting heavy, have a spotter ready, or use a squat rack or power rack.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black, // Text color
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 50),
            Text(
              'TARGETED MUSCLES',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.amber[800], // Text color
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Image.asset('assets/images/sqtmusc.png'), // Add your image asset
            ),
            const SizedBox(height: 50),
            Center(
              child: SizedBox(
                width: 150, // Fixed width for the button
                child: ElevatedButton(
                  onPressed: () {
                    // Add your tracking functionality here
                  },
                  child: Text(
                    'TRACK',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[800],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}