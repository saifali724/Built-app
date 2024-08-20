import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'web.dart'; // Import the WebScreen
import 'app.dart'; // Import the AppScreen
import 'social.dart'; // Import the SocialScreen
import 'cyber.dart'; // Import the CyberScreen
import 'ui.dart'; // Import the UIScreen
import 'brand.dart'; // Import the BrandScreen
import 'film.dart'; // Import the FilmScreen
import 'graphic.dart'; // Import the GraphicDesignScreen

class ServicesScreen extends StatelessWidget {
  final List<String> services = [
    'Website Development',
    'Mobile Apps Development',
    'Social Media Marketing',
    'Cyber Security',
    'UI/UX',
    'Brand Strategy',
    'Film Making',
    'Graphic Design',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Increased height for the AppBar
        child: Padding(
          padding: EdgeInsets.only(top: 20.0), // Move the AppBar down
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
            ),
            title: Text(
              'Services',
              style: TextStyle(
                color: Color(0xFF0B8FAC), // New color for the title
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true, // Center the title
            actions: [
              IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(services: services),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0), // Space between the AppBar and the containers
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two containers per row
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 167.65 / 214.02, // Aspect ratio based on width and height
                ),
                itemBuilder: (context, index) {
                  return _buildServiceItem(context, services[index]);
                },
              ),
            ),
          ),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30.0), // Increased icon size
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time, size: 30.0), // Increased icon size
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message, size: 30.0), // Increased icon size
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30.0), // Increased icon size
                label: '',
              ),
            ],
            currentIndex: 1, // Set the index to the clock icon
            selectedItemColor: Color(0xFF0B8FAC), // New color
            unselectedItemColor: Colors.black,
            onTap: (index) {
              if (index == 0) {
                // Navigate to HomeScreen when Home icon is tapped
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
              // Handle other taps if needed
            },
            type: BottomNavigationBarType.fixed,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'Website Development') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WebScreen()), // Navigate to WebScreen
          );
        } else if (label == 'Mobile Apps Development') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppScreen()), // Navigate to AppScreen
          );
        } else if (label == 'Social Media Marketing') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SocialScreen()), // Navigate to SocialScreen
          );
        } else if (label == 'Cyber Security') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CyberScreen()), // Navigate to CyberScreen
          );
        } else if (label == 'UI/UX') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UIScreen()), // Navigate to UIScreen
          );
        } else if (label == 'Brand Strategy') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BrandScreen()), // Navigate to BrandScreen
          );
        } else if (label == 'Film Making') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilmScreen()), // Navigate to FilmScreen
          );
        } else if (label == 'Graphic Design') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GraphicDesignScreen()), // Navigate to GraphicDesignScreen
          );
        }
        // Add navigation for other services if needed
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            // Background Image
            if (label == 'Website Development')
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'lib/assets/website.png',
                    fit: BoxFit.cover, // This makes the image cover the entire container
                  ),
                ),
              )
            else if (label == 'Mobile Apps Development')
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'lib/assets/app.png',
                    fit: BoxFit.cover, // This makes the image cover the entire container
                  ),
                ),
              )
            else if (label == 'Social Media Marketing')
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'lib/assets/social.png',
                      fit: BoxFit.cover, // This makes the image cover the entire container
                    ),
                  ),
                )
              else if (label == 'Cyber Security')
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/assets/cyber.png',
                        fit: BoxFit.cover, // This makes the image cover the entire container
                      ),
                    ),
                  )
                else if (label == 'UI/UX')
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/assets/ui.png',
                          fit: BoxFit.cover, // This makes the image cover the entire container
                        ),
                      ),
                    )
                  else if (label == 'Brand Strategy')
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'lib/assets/brand.png',
                            fit: BoxFit.cover, // This makes the image cover the entire container
                          ),
                        ),
                      )
                    else if (label == 'Film Making')
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'lib/assets/film.png',
                              fit: BoxFit.cover, // This makes the image cover the entire container
                            ),
                          ),
                        )
                      else if (label == 'Graphic Design')
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'lib/assets/graphic.png',
                                fit: BoxFit.cover, // This makes the image cover the entire container
                              ),
                            ),
                          )
                        else
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF0B8FAC), // New color for non-image items
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
            // Label Text
            Positioned(
              bottom: 10, // Positioned the box slightly above the bottom
              left: (167.65 - 136) / 2, // Center the box horizontally
              child: Container(
                height: 42,
                width: 136,
                decoration: BoxDecoration(
                  color: Color(0xFF0B8FAC), // Background color of the box
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                child: Center(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 14.0, // Font size similar to the image
                      fontWeight: FontWeight.bold,
                    ),
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
