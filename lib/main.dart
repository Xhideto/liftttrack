import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'datab/signup_activity.dart';
import 'navigation/home.dart';
import 'datab/forget_password.dart';
import 'datab/account_information.dart';
import 'datab/app_instructions.dart';
import 'datab/api_service.dart';

void main() => runApp(LiftTrackApp());
class LiftTrackApp extends StatelessWidget {
  const LiftTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),  // Ensure /login route exists
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/forget_password': (context) => ForgotPasswordScreen(),
        '/account_information': (context) => AccountInformationScreen(),
        '/app_instructions': (context) => AppInstructionsScreen(),
      },
    );
  }
}
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool isLoading = false;
  String connectionMessage = "Checking API connection...";

  @override
  void initState() {
    super.initState();
    _checkApiConnection();
  }

  Future<void> _checkApiConnection() async {
    final url = Uri.parse('http://127.0.0.1:8000/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          connectionMessage = "Connected to API";
        });
      } else {
        setState(() {
          connectionMessage = "Failed to connect to API";
        });
      }
    } catch (e) {
      setState(() {
        connectionMessage = "API connection error: $e";
      });
    }
  }

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    final username = usernameController.text;
    final password = passwordController.text;

    // Bypass login if username and password are "dev"
    if (username == "dev" && password == "dev") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      return;
    }

    // Regular login flow using ApiService
    final userData = await _apiService.getUser(username);
    if (userData != null && userData['password'] == password) {
      await _apiService.saveUserData(username); // Store user data on successful login
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIFTTRACK'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                connectionMessage,
                style: TextStyle(fontSize: 16, color: Colors.redAccent),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _login,
                              child: Text('Login'),
                            ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forget_password');
                        },
                        child: Text('Forgot your password?'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text("Don't have an account?"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}