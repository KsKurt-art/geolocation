import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

/// A StatefulWidget representing a screen that displays sensor data including
/// accelerometer, user accelerometer, and gyroscope readings.
class SensorScreen extends StatefulWidget {
  @override
  _SensorScreenState createState() => _SensorScreenState();
}

/// The State class for the SensorScreen widget.
class _SensorScreenState extends State<SensorScreen> {
  /// Stores the current accelerometer values (x, y, z).
  List<double> _accelerometerValues = [0, 0, 0];

  /// Stores the current user accelerometer values (x, y, z).
  List<double> _userAccelerometerValues = [0, 0, 0];

  /// Stores the current gyroscope values (x, y, z).
  List<double> _gyroscopeValues = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    // Get sensor data
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = [event.x, event.y, event.z];
      });
    });
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = [event.x, event.y, event.z];
      });
    });
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = [event.x, event.y, event.z];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text('Accelerometer'),
                  subtitle: Text(
                      'X: ${_accelerometerValues[0].toStringAsFixed(2)}, Y: ${_accelerometerValues[1].toStringAsFixed(2)}, Z: ${_accelerometerValues[2].toStringAsFixed(2)}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('User Accelerometer'),
                  subtitle: Text(
                      'X: ${_userAccelerometerValues[0].toStringAsFixed(2)}, Y: ${_userAccelerometerValues[1].toStringAsFixed(2)}, Z: ${_userAccelerometerValues[2].toStringAsFixed(2)}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Gyroscope'),
                  subtitle: Text(
                      'X: ${_gyroscopeValues[0].toStringAsFixed(2)}, Y: ${_gyroscopeValues[1].toStringAsFixed(2)}, Z: ${_gyroscopeValues[2].toStringAsFixed(2)}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
