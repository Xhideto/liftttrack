// lib/upper_body_page.dart
import 'package:flutter/material.dart';
import 'package:lifttrack/upperex/bpress.dart';
import 'package:lifttrack/upperex/pcurl.dart';
import 'package:lifttrack/upperex/spress.dart';
// import 'exercard.dart'; // Import the ExerciseCard

class UpperBodyPage extends StatelessWidget {
  const UpperBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPPER BODY EXERCISES', style: TextStyle(color: Colors.white)), // White text
        backgroundColor: Colors.deepOrange.shade400,
        elevation: 3,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'SELECT AN EXERCISE',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange[600],
                ),
              ),
            ),
            const SizedBox(height: 60),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300, // Fixed width for the cards
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BenchPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.amber[800], // Button color
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'BENCH PRESS', // Updated text
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Text color
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300, // Fixed width for the cards
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShoulderPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.amber[800], // Button color
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'SHOULDER PRESS', // Updated text
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Text color
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300, // Fixed width for the cards
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PreacherPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.amber[800], // Button color
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'PREACHER CURL', // Updated text
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Text color
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
