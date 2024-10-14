import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Fixed bottom navigation bar
      backgroundColor: Colors.grey[200], // Background color
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Progress',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Exercise',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.deepOrange[600], // Match color palette
      unselectedItemColor: Colors.grey, // Unselected item color
      onTap: onItemTapped,
    );
  }
}