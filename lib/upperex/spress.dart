// lib/upperex/spress.dart
import 'package:flutter/material.dart';

class ShoulderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoulder Press'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Shoulder Press',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset('assets/gifs/sp.gif'), // Add your GIF asset
            ),
            SizedBox(height: 20),
            Text(
              'PREPARATION',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Feet hip-width, grab bar wider than shoulders. Brace core, press up slow and steady, lower with control. Light weight, good form first.',
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              'EXECUTION',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Stand with feet hip-width apart, grip the bar wider than shoulders, and brace your core.\n'
                  '2. Press the bar up in a slow and controlled manner, keeping your elbows tucked at a 45-degree angle.\n'
                  '3. Lower the bar back down with control, maintaining a neutral spine throughout the movement.',
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              'TIPS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Shoulder press strong! Push bar straight up, brush your ears with it. Keep your core tight and back strong. Control the weight, smooth moves only!',
            ),
          ],
        ),
      ),
    );
  }
}
