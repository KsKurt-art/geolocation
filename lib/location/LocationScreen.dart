import 'package:flutter/material.dart';
import 'LocationService.dart';


/// A StatefulWidget representing a screen that displays the user's location information.
///
/// This screen fetches and displays the user's current latitude, longitude, and address
/// using the [LocationService] class.
class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

/// The State class for the LocationScreen widget.
class _LocationScreenState extends State<LocationScreen> {
  LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _getLocation(); // Call the method to fetch location when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text(
                    'Latitude:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${_locationService.latitude}',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Longitude:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${_locationService.longitude}',
                  ),
                ),
              ),
              _locationService.isLoading
                  ? CircularProgressIndicator()
                  : Card(
                child: ListTile(
                  title: Text(
                    'Address:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${_locationService.address}',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Fetches the user's location information asynchronously and updates the UI.
  Future<void> _getLocation() async {
    await _locationService.getLocation();
    setState(() {});
  }
}
