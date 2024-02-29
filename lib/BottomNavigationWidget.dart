import 'package:flutter/material.dart';
import 'location/LocationScreen.dart';
import 'sensor/SensorScreen.dart';

/// A StatefulWidget representing a bottom navigation bar with screens for location and sensor data.
class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

/// The State class for the BottomNavigationWidget widget.
class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;

  /// Called when a bottom navigation item is tapped.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.gps_fixed),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Sensor',
          ),
        ],
      ),
    );
  }

  /// Returns the appropriate screen based on the selected index.
  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return LocationScreen(); // Create a widget for your first screen
      case 1:
        return SensorScreen(); // Create a widget for your second screen
      default:
        return Container();
    }
  }
}
