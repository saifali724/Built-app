import 'package:flutter/material.dart';
import 'services.dart'; // Import the ServicesScreen
import 'calendar.dart'; // Import the CalendarScreen
import 'message.dart'; // Import the MessageScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _showAllServices = false;
  bool _isSearching = false;
  String _searchQuery = '';

  final List<String> _services = [
    'Website Development',
    'Mobile Apps Development',
    'Social Media Marketing',
    'Cyber Security',
    'Graphic Designing',
    'Brand Strategy',
  ];

  List<String> get _filteredServices {
    if (_searchQuery.isEmpty) {
      return _services;
    } else {
      return _services.where((service) => service.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) { // Clock icon is at index 1
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CalendarScreen()), // Navigate to CalendarScreen
      );
    } else if (index == 2) { // Message icon is at index 2
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MessageScreen()), // Navigate to MessageScreen
      );
    } else if (index == 0) { // Home icon or any other icons
      // Handle home navigation if needed
    } else if (index == 3) { // Person icon
      // Handle person navigation if needed
    }
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchQuery = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        title: _isSearching
            ? Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: () {
                setState(() {
                  _isSearching = false;
                  _searchQuery = '';
                });
              },
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
                onSubmitted: (query) {
                  setState(() {
                    _isSearching = false;
                    _searchQuery = query;
                  });
                },
              ),
            ),
          ],
        )
            : Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('lib/profile_picture.png'),
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Saif Ali',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: _toggleSearch,
              iconSize: 28.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.0),
            if (!_isSearching) ...[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Services',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ServicesScreen()),
                        );
                      },
                      child: Text(
                        'see all',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF0B8FAC), // New color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildServiceCard(label: 'Website Development'),
                    SizedBox(width: 13.0),
                    _buildServiceCard(label: 'Mobile Apps Development'),
                    SizedBox(width: 16.0),
                    _buildServiceCard(label: 'Social Media Marketing'),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF0B8FAC), // New color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tech Consultation',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Text(
                          'Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/tech_consultation_image.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildServiceCard(label: 'Cyber Security'),
                    SizedBox(width: 13.0),
                    _buildServiceCard(label: 'Graphic Designing'),
                    SizedBox(width: 16.0),
                    _buildServiceCard(label: 'Brand Strategy'),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'How can we assist you?',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ServicesScreen()),
                        );
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF0B8FAC), // New color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildAssistanceCard(
                title: 'Do you want to improve your website?',
                description:
                'This file is totally free for education purpose, for commercial license please contact us.',
                buttonText: 'Book Appointment',
              ),
              _buildAssistanceCard(
                title: 'Want to market your business better?',
                description:
                'This file is totally free for education purpose, for commercial license please contact us.',
                buttonText: 'Book Appointment',
              ),
              _buildAssistanceCard(
                title: 'Have you thought about an aesthetic video for your business?',
                description:
                'This file is totally free for education purpose, for commercial license please contact us.',
                buttonText: 'Book Appointment',
              ),
            ] else ...[
              // Display search results
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search Results',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ..._filteredServices.map((service) => ListTile(
                      title: Text(service),
                      onTap: () {
                        // Handle tap on search result if needed
                      },
                    )),
                    if (_filteredServices.isEmpty)
                      Center(
                        child: Text(
                          'No results found',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0B8FAC), // New color
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildServiceCard({required String label}) {
    return Container(
      width: 113.0, // Set the width
      height: 99.0, // Set the height
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF0B8FAC), // New color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0, // Set text size here
          ),
        ),
      ),
    );
  }

  Widget _buildAssistanceCard({
    required String title,
    required String description,
    required String buttonText,
  }) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity, // Makes the button full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalendarScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0B8FAC), // New color
                  padding: EdgeInsets.symmetric(vertical: 14.0), // Increases button height
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 16.0, // Adjusts text size if needed
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
