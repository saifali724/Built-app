import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToSignIn();
  }

  _navigateToSignIn() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 50), // Space for status bar
              Spacer(),
              Text(
                'Tech Buddy',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B8FAC),
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    'Powered By',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0B8FAC),
                    ),
                  ),
                  Text(
                    'ORCA CLAN TECH',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
