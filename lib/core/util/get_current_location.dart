import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetLocation{
  late CameraPosition cameraPosition;
  LatLng latLng = const LatLng(24.0192811,52.8593783);
 Future<Map<String,dynamic>> getCurrentLocation() async {
    bool serviceEnabled;

    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    cameraPosition = CameraPosition(target: latLng,zoom: 5);
    return await {
      'latitude':position.latitude,
      'longitude':position.longitude
    };
  }
}