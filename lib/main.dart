import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'datab/signup_activity.dart';
import 'navigation/home.dart';

void main() => runApp(LiftTrackApp());

class LiftTrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(), // Use WelcomeScreen as the home page
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 50), // Add some space at the top
          Container(
            child: Center(
              child: Text(
                'L  I  F  T  T  R  A  C  K',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Bebas Neue', // Change the font family to Bebas Neue
                  color: Colors.deepOrange.shade600,
                  shadows: [
                    Shadow(
                      color: Colors.black87,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Card(
                        elevation: 3, // Remove the shadow by setting elevation to 0
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'LOGIN',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange[600]),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                obscureText: true,
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/home');
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: Colors.deepOrange[600],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.login),
                                    SizedBox(width: 10),
                                    Text('Login'),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Handle forgot password logic
                                },
                                child: Text('Forgot your password?'),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.deepOrange[600],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                                child: Text("Don't have an account?"),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.deepOrange[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}