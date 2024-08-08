import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60), // Space for status bar
            Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 40, // Increased font size
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B8FAC),
                ),
              ),
            ),
            SizedBox(height: 30), // Increased space
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 30, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12), // Increased space
            Text(
              'Enter your email and password to login to your account',
              style: TextStyle(
                fontSize: 20, // Increased font size
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30), // Increased space

            // Spacer to push the input fields down
            Spacer(flex: 1), // Adjust the flex value as needed

            Text(
              'Email',
              style: TextStyle(
                fontSize: 20, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12), // Increased space
            TextField(
              style: TextStyle(fontSize: 22), // Increased font size
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Increased height
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), // Increased border radius
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 30), // Increased space
            Text(
              'Password',
              style: TextStyle(
                fontSize: 20, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12), // Increased space
            TextField(
              obscureText: _obscureText,
              style: TextStyle(fontSize: 22), // Increased font size
              decoration: InputDecoration(
                hintText: 'Enter Your Password',
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Increased height
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), // Increased border radius
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            SizedBox(height: 30), // Increased space
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Forgot Password'),
                      content: Text('Password reset instructions have been sent to your email.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black, // Text color
                ),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 16, // Increased font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Spacer(flex: 2), // Adjust the flex value as needed

            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 18), // Set text color to white and increased font size
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0B8FAC),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 18), // Increased padding
                  textStyle: TextStyle(
                    fontSize: 18, // Increased font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30), // Increased space
            Center(
              child: Text(
                'OR',
                style: TextStyle(
                  fontSize: 16, // Increased font size
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 30), // Increased space
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.apple, size: 50, color: Color(0xFF000000)), // Increased icon size
                    onPressed: () {},
                  ),
                  SizedBox(width: 20), // Increased space
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook, size: 50, color: Color(0xFF1877F2)), // Increased icon size
                    onPressed: () {},
                  ),
                  SizedBox(width: 20), // Increased space
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.google, size: 50, color: Color(0xFF4285F4)), // Increased icon size
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 30), // Increased space
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.black, fontSize: 16), // Increased font size
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF0B8FAC),
                        fontWeight: FontWeight.bold,
                        fontSize: 16, // Increased font size
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
