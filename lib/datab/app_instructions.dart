import 'package:flutter/material.dart';

class AppInstructionsScreen extends StatelessWidget {
  const AppInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Instructions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            InstructionItem(
              icon: Icons.account_circle,
              title: 'Profile Management',
              description:
                  'View and edit your personal profile information, including your name, contact information, and profile picture.',
            ),
            InstructionItem(
              icon: Icons.lock,
              title: 'Security & Privacy',
              description:
                  'Ensure your data privacy by updating your password and managing security settings.',
            ),
            InstructionItem(
              icon: Icons.fitness_center,
              title: 'Track Your Progress',
              description:
                  'Keep track of your workout sessions and progress over time to stay motivated and improve.',
            ),
            InstructionItem(
              icon: Icons.insights,
              title: 'Analyze Your Performance',
              description:
                  'View detailed insights into your performance and progress to help optimize your workout plans.',
            ),
            InstructionItem(
              icon: Icons.settings,
              title: 'App Settings',
              description:
                  'Customize your experience by adjusting various app settings, including notifications and theme preferences.',
            ),
          ],
        ),
      ),
    );
  }
}

class InstructionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InstructionItem({
    required this.icon,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.deepOrange),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
