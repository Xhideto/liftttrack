// lib/upperex/bpress.dart
import 'package:flutter/material.dart';

class BenchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bench Press'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'BENCH PRESS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset('assets/gifs/bench.gif'), // Add your GIF asset
            ),
            SizedBox(height: 20),
            Text(
              'PREPARATION',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Lie flat on the bench with your feet planted, core engaged, and grip the bar slightly wider than shoulder-width apart. Maintain a neutral spine throughout the lift as you lower the bar to your sternum.',
            ),
            SizedBox(height: 20),
            Text(
              'EXECUTION',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Lie down, plant your feet, tighten your core, and grip the bar wider than shoulders.\n'
                  '2. Lower the bar to your lower chest with elbows tucked at a 45-degree angle.\n'
                  '3. Push the bar back up in a straight line, squeezing your chest at the top.',
            ),
            SizedBox(height: 20),
            Text(
              'TIPS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Engage your core to keep your back stable, maintain a slight arch in your lower back, and keep your elbows tucked in at a 45-degree angle throughout the movement. As you press the bar, concentrate on using your chest muscles to drive the movement. Imagine squeezing your chest at the top of the lift for an extra activation boost.',
            ),
            SizedBox(height: 20),
            Text(
              'TARGETED MUSCLES',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Center(
              child: Image.asset('assets/images/bpmusc.png'), // Add your image asset
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
