// lib/upperex/spress.dart
import 'package:flutter/material.dart';
import 'package:lifttrack/cam/cameraSP.dart';

class ShoulderPage extends StatelessWidget {
  const ShoulderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHOULDER PRESS', style: TextStyle(color: Colors.white)), // White text
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
                'SHOULDER PRESS',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange[600],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Image.asset('assets/gifs/sp.gif'), // Add your GIF asset
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
              '     Feet hip-width, grab bar wider than shoulders. Brace core, press up slow and steady, lower with control. Light weight, good form first.',
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
              '1. Stand with feet hip-width apart, grip the bar wider than shoulders, and brace your core.\n\n'
                  '2. Press the bar up in a slow and controlled manner, keeping your elbows tucked at a 45-degree angle.\n\n'
                  '3. Lower the bar back down with control, maintaining a neutral spine throughout the movement.',
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
              'Shoulder press strong! Push bar straight up, brush your ears with it. Keep your core tight and back strong. Control the weight, smooth moves only!',
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
              child: Image.asset('assets/images/spm.png'), // Add your image asset
            ),
            const SizedBox(height: 50),
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