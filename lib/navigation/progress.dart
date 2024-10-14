import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROGRESS', style: TextStyle(color: Colors.white)), // White text
        backgroundColor: Colors.deepOrange.shade600,
        elevation: 3,
        automaticallyImplyLeading: false, // Remove the back button
      ),
    );
  }
}
