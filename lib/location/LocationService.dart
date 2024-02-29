import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

/// A service class responsible for fetching the user's location information
/// and reverse geocoding to get the corresponding address.
class LocationService {
  /// The latitude coordinate of the user's current location.
  String latitude = '';

  /// The longitude coordinate of the user's current location.
  String longitude = '';

  /// The address corresponding to the user's current location.
  String address = '';

  /// Indicates whether the location service is currently loading data.
  bool isLoading = false;

  /// Fetches the user's location and updates the latitude, longitude, and address.
  Future<void> getLocation() async {
    isLoading = true;

    try {
      final String apiKey = '757bb5a2749eb2d1c1709499311c2f68aeb39602';

      // Get the user's current position
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Update latitude and longitude
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();

      // Make a request to reverse geocode the coordinates to get the address
      final String apiUrl =
          'http://suggestions.dadata.ru/suggestions/api/4_1/rs/geolocate/address';
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Token $apiKey',
        },
        body: json.encode({
          'lat': double.parse(latitude),
          'lon': double.parse(longitude),
        }),
      );

      // Decode the response and extract the address
      final decoded = json.decode(response.body);
      if (decoded['suggestions'] != null && decoded['suggestions'].isNotEmpty) {
        address = decoded['suggestions'][0]['value'];
      } else {
        address = "Не удалось определить адрес";
      }
    } catch (error) {
      print("Error: $error");
      address = error.toString();
    } finally {
      isLoading = false;
    }
  }
}

