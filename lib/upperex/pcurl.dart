// lib/upperex/pcurl.dart
import 'package:flutter/material.dart';

class PreacherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preacher Curl'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Preacher Curl',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset('assets/gifs/prc.gif'), // Add your GIF asset
            ),
            SizedBox(height: 20),
            Text(
              'PREPARATION',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Preacher curls are biceps heaven! Adjust the pad for comfy elbows, grab dumbbells, and curl them up slow and steady, squeezing your biceps hard at the top. Lighter weight is your friend to start, focus on that bicep burn!',
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              'EXECUTION',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Adjust the preacher curl pad so your elbows are comfortable and your armpits are resting on the pad.\n'
                  '2. Grab a dumbbell in each hand, curl them up in a slow and controlled manner, and squeeze your biceps at the top.\n'
                  '3. Lower the dumbbells back down with control, maintaining a neutral spine throughout the movement.',
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              'TIPS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Preacher curls are all about the biceps! Focus on squeezing your biceps at the top of the movement and lowering the weight with control. Keep your core tight and your back straight to avoid swinging the weight.',
            ),
          ],
        ),
      ),
    );
  }
}
