// lib/upperex/bpress.dart
import 'package:flutter/material.dart';

class RdlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RDL'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'ROMAN DEADLIFT',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset('assets/gifs/rdl.gif'), // Add your GIF asset
            ),
            SizedBox(height: 20),
            Text(
              'PREPARATION',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Stand tall with your feet roughly hip-distance apart. Hold a barbell in both hands directly in front of your thighs with your hands shoulder-distance apart (slightly wider than your thighs).',
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              'EXECUTION',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Start with a very slight bend in your knees. Roll your shoulders back, drawing your shoulder blades toward your spine to engage your upper back. Your shoulders should remain pulled back like this throughout the exercise.\n'
                  '2. Inhale and press your hips back. Continue pressing them back (like your hips are hinging), as your torso naturally begins to lean forward toward the floor.\n'
                  '3. Keep the barbell close to your thighs (almost grazing the front of them) as you hinge forward from the hips.\n'
                  '4. Stop hinging at your hips when you feel a stretch through your hamstrings. The barbell does not have to reach the floor. \n'
                  '5. Exhale and use your hamstrings and glutes to "pull" your torso back to standing as you actively press your hips forward. You should not use your back or core to pull yourself back to standing.',
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              'TIPS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'As you press your hips back, your knees shouldn\'t simultaneously begin to bend—this isn\'t a squat. In fact, your knees should remain relatively static throughout the exercise.\nLikewise, remember to keep your shoulders back and your core engaged so your torso maintains perfect posture as your hips hinge..',
            ),
            SizedBox(height: 20),
            Text(
              'TARGETED MUSCLES',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Center(
              child: Image.asset('assets/images/rdlll.png'), // Add your image asset
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your tracking functionality here
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