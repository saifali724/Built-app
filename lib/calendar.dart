import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'success.dart';  // Import the success screen
import 'home_screen.dart';  // Import the home screen

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> _timeSlots = [];
  String? _selectedTimeSlot;

  @override
  void initState() {
    super.initState();
    _generateTimeSlots();
  }

  void _generateTimeSlots() {
    _timeSlots = [];
    for (int i = 9; i <= 17; i++) { // Start from 9 AM to 5 PM
      String period = i >= 12 ? 'PM' : 'AM';
      int hour = i % 12; // Convert 24-hour format to 12-hour format
      hour = hour == 0 ? 12 : hour; // Handle the 12-hour format for 12 PM
      _timeSlots.add('${hour.toString().padLeft(2, '0')}.00 $period');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final tealColor = Color(0xFF0B8FAC);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenSize.height * 0.1, // Adjusts the height of the AppBar
        title: Padding(
          padding: EdgeInsets.only(top: screenSize.height * 0.02), // Moves the text downwards
          child: Text(
            'Select Date And Time',
            style: TextStyle(
              color: tealColor,
              fontSize: screenSize.width * 0.065,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: screenSize.height * 0.5, // Adjust height
                  maxWidth: screenSize.width * 0.95, // Increased width
                ),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarFormat: CalendarFormat.month,
                  availableGestures: AvailableGestures.all,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronIcon: Icon(Icons.chevron_left, color: tealColor),
                    rightChevronIcon: Icon(Icons.chevron_right, color: tealColor),
                    headerPadding: EdgeInsets.symmetric(vertical: 4),
                    titleTextStyle: TextStyle(
                      fontSize: screenSize.width * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: screenSize.width * 0.04,
                    ),
                    weekendStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: screenSize.width * 0.04,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: tealColor,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: tealColor.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    defaultTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: screenSize.width * 0.05,
                    ),
                    weekendTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: screenSize.width * 0.05,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Available Time Slot',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenSize.width * 0.045,
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                          color: tealColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenSize.width * 0.04,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.015),
                  Container(
                    height: screenSize.height * 0.1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _timeSlots.length,
                      itemBuilder: (context, index) {
                        final timeSlot = _timeSlots[index];
                        final isSelected = _selectedTimeSlot == timeSlot;
                        bool isSpecialTimeSlot = timeSlot.contains('10.00') || timeSlot.contains('11.00') || timeSlot.contains('12.00');
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
                          child: SizedBox(
                            width: isSpecialTimeSlot ? 129 : 129, // Adjust width for specific time slots
                            height: isSpecialTimeSlot ? 55 : 55, // Adjust height for specific time slots
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _selectedTimeSlot = timeSlot;
                                });
                              },
                              child: Text(
                                timeSlot,
                                style: TextStyle(
                                  fontSize: screenSize.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isSelected ? tealColor : Colors.white,
                                side: BorderSide(
                                  color: tealColor,
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: screenSize.height * 0.015,
                                  horizontal: screenSize.width * 0.05,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              Center(
                child: SizedBox(
                  width: 376.55, // Set the width
                  height: 60, // Set the height
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SuccessScreen()), // Navigate to SuccessScreen
                      );
                    },
                    child: Text(
                      'Set Appointment',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.045,
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
              SizedBox(height: screenSize.height * 0.1), // Add space at the bottom
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: 1,  // Assuming this is the Calendar tab
        selectedItemColor: tealColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to HomeScreen
            );
          } else {
            // Handle other navigation items if needed
          }
        },
      ),
    );
  }
}
