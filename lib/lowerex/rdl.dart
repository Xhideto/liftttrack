// lib/upperex/bpress.dart
import 'package:flutter/material.dart';

class RdlPage extends StatelessWidget {
  const RdlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RDL', style: TextStyle(color: Colors.white)), // White text
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
                'ROMAN DEADLIFT',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange[600],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Image.asset('assets/gifs/rdl.gif'), // Add your GIF asset
            ),
            const SizedBox(height: 40),
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
              '     Stand tall with your feet roughly hip-distance apart. Hold a barbell in both hands directly in front of your thighs with your hands shoulder-distance apart (slightly wider than your thighs).',
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
              '1. Start with a very slight bend in your knees. Roll your shoulders back, drawing your shoulder blades toward your spine to engage your upper back.\n\n'
                  '2. Inhale and press your hips back. Continue pressing them back (like your hips are hinging), as your torso naturally begins to lean forward toward the floor.\n\n'
                  '3. Keep the barbell close to your thighs (almost grazing the front of them) as you hinge forward from the hips.\n\n'
                  '4. Stop hinging at your hips when you feel a stretch through your hamstrings. The barbell does not have to reach the floor. \n\n'
                  '5. Exhale and use your hamstrings and glutes to "pull" your torso back to standing as you actively press your hips forward. You should not use your back or core to pull yourself back to standing.',
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
              'As you press your hips back, your knees shouldn\'t simultaneously begin to bend—this isn\'t a squat. In fact, your knees should remain relatively static throughout the exercise.\nLikewise, remember to keep your shoulders back and your core engaged so your torso maintains perfect posture as your hips hinge.',
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
            const SizedBox(height: 10),
            Center(
              child: Image.asset('assets/images/rdlll.png'), // Add your image asset
            ),
            const SizedBox(height: 30),
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