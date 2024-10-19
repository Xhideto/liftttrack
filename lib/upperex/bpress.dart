// lib/upperex/bpress.dart
import 'package:flutter/material.dart';
import 'package:lifttrack/cam/camera.dart';

class BenchPage extends StatelessWidget {
  const BenchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BENCH PRESS', style: TextStyle(color: Colors.white)), // White text
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
                'BENCH PRESS',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange[600],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Image.asset('assets/gifs/bench.gif'), // Add your GIF asset
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
              '     Lie flat on the bench with your feet planted, core engaged, and grip the bar slightly wider than shoulder-width apart.\n\n'
                  '     Maintain a neutral spine throughout the lift as you lower the bar to your sternum.',
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
              '1. Lie down, plant your feet, tighten your core, and grip the bar wider than shoulders.\n\n'
                  '2. Lower the bar to your lower chest with elbows tucked at a 45-degree angle.\n\n'
                  '3. Push the bar back up in a straight line, squeezing your chest at the top.',
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
              'Engage your core to keep your back stable, maintain a slight arch in your lower back, and keep your elbows tucked in at a 45-degree angle throughout the movement.\n As you press the bar, concentrate on using your chest muscles to drive the movement. Imagine squeezing your chest at the top of the lift for an extra activation boost.',
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
              child: Image.asset('assets/images/bpmusc.png'), // Add your image asset
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
                  child: Text(
                    'TEST CAMERA',
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
