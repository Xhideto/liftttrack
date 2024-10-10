// lib/exercise_page.dart
import 'package:flutter/material.dart';
import '../exercise/exercard.dart'; // Import the ExerciseCard
import '../exercise/upper.dart';
import '../exercise/lower.dart';

import 'bar.dart'; // Import the UpperBodyPage

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int _selectedIndex = 1; // Set the initial index to 1 for ExercisePage

  void _onItemTapped(int index) {
    if (index == 0 || index == 2) {
      Navigator.pop(context); // Go back to HomeScreen
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EXERCISES'),
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExerciseCard(
              title: 'UPPER',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpperBodyPage()),
                );
              },
            ),
            SizedBox(height: 20),
            ExerciseCard(
              title: 'LOWER',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LowerBodyPage()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
