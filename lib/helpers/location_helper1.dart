import 'package:geolocator/geolocator.dart';
import 'package:firebase_database/firebase_database.dart';

class LocationHelper1 {
  static Future<Position> getCurrentLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.requestPermission();
    }

    final databaseReference = FirebaseDatabase.instance.ref();
    final positionStream = databaseReference.child('Location').onValue;

    return positionStream.map((event) {
      final snapshot = event.snapshot;
      final value = snapshot.value as Map<dynamic, dynamic>?;

      if (value != null) {
        final latitude = double.parse(value['latitude'].toString());
        final longitude = double.parse(value['longitude'].toString());

        return Position(
          latitude: latitude,
          longitude: longitude,
          timestamp: DateTime.now(),
          accuracy: 0.0,
          altitude: 0.0,
          heading: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0,
        );
      } else {
        // Return a default position if the value is null
        return Position(
          latitude: 0.0,
          longitude: 0.0,
          timestamp: DateTime.now(),
          accuracy: 0.0,
          altitude: 0.0,
          heading: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0,
        );
      }
    }).first;
  }
}
