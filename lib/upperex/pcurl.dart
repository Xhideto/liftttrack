// lib/upperex/pcurl.dart
import 'package:flutter/material.dart';
import 'package:lifttrack/cam/cameraPC.dart';

class PreacherPage extends StatelessWidget {
  const PreacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PREACHER CURL', style: TextStyle(color: Colors.white)), // White text
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
                'PREACHER CURL',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange[600],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Image.asset('assets/gifs/prc.gif'), // Add your GIF asset
            ),
            const SizedBox(height: 30),
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
              '       Preacher curls are biceps heaven! Adjust the pad for comfy elbows, grab dumbbells, and curl them up slow and steady, squeezing your biceps hard at the top. Lighter weight is your friend to start, focus on that bicep burn!',
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
              '1. Adjust the preacher curl pad so your elbows are comfortable and your armpits are resting on the pad.\n\n'
                  '2. Grab a dumbbell in each hand, curl them up in a slow and controlled manner, and squeeze your biceps at the top.\n\n'
                  '3. Lower the dumbbells back down with control, maintaining a neutral spine throughout the movement.',
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
              'Preacher curls are all about the biceps! Focus on squeezing your biceps at the top of the movement and lowering the weight with control. Keep your core tight and your back straight to avoid swinging the weight.',
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
              child: Image.asset('assets/images/pcm.png'), // Add your image asset
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 150, // Fixed width for the button
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VideoPage())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[800],
                  ),
                  child: Text(
                    'TRACK',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
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
