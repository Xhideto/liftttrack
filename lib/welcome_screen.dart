import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepOrange.shade200, // Light orange
              Colors.white, // White
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 300,
              width: 300,
              margin: EdgeInsets.only(top: 150),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Add this to center the column vertically
                    children: [
                      SizedBox(height: 0.10),
                      Text(
                        'Welcome to LiftTrack',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Bebas Neue', // Use the same font family as the app
                          color: Colors.deepOrange.shade600, // Dark orange text color
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.deepOrange.shade600,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text('Get Started'),
                      ),
                    ],
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