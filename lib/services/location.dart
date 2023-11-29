import 'package:geolocator/geolocator.dart';

class Location {
  double latitude=40.712776;
  double longitude=-74.005974;

  Future<void> getCurrentLocation() async {

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever) {
        // Provide feedback to the user
        //('Location permission denied forever. Please enable it in settings.');

        // Open app settings and location settings
        await Geolocator.openLocationSettings();
        await Geolocator.openAppSettings();
      }

    }
  }
}
