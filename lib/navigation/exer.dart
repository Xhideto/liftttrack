import 'package:flutter/material.dart';

import 'bar.dart';

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
        automaticallyImplyLeading: true, // This adds the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExerciseCard(
              title: 'UPPER',
              onTap: () {
                // Navigate to upper body exercises page
              },
            ),
            SizedBox(height: 20),
            ExerciseCard(
              title: 'LOWER',
              onTap: () {
                // Navigate to lower body exercises page
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

class ExerciseCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  ExerciseCard({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.center,
          height: 100,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
