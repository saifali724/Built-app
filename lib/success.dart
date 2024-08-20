import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tealColor = Color(0xFF0B8FAC);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_sharp,
                  color: tealColor,
                  size: 200.0,
                ),
                SizedBox(height: 30), // Adjust height to move "Congratulations" closer to the next text
                Text(
                  'Congratulations',
                  style: TextStyle(
                    color: tealColor,
                    fontWeight: FontWeight.w900, // Extra bold
                    fontSize: 40.0,
                  ),
                ),
                SizedBox(height: 20), // Adjust height to move "Your Appointment Is Successfully Booked!!!" closer
                Text(
                  'Your Appointment Is Successfully Booked!!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600, // Semi-bold
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: 376.55, // Set the width
                height: 60, // Set the height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Goes back to the previous screen
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tealColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
