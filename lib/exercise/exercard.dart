// lib/exercise_card.dart
import 'package:flutter/material.dart';

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
