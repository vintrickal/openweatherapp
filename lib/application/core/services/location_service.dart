import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Either<String, bool>> requestPermission() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return left('Location services are disabled');
  }

  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return left('Location permissions are denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return left('Location permissions are permanently denied.');
  }

  return right(true);
}

Future<LatLng> getLastKnownPosition() async {
  Position? position = await Geolocator.getLastKnownPosition();

  if (position != null) {
    return LatLng(position.latitude, position.longitude);
  } else {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    return LatLng(position.latitude, position.longitude);
  }
}

Future<LatLng> getCurrentPosition() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation);

  return LatLng(position.latitude, position.longitude);
}
