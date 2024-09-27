
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:weather_now/ViewModel/Controllers/location_controller.dart';


class LocationService {
  LocationService.init();
  static LocationService instance = LocationService.init();

  final Location _location = Location();

  Future<bool> checkForServiceAvailability() async {
    bool isEnabled = await _location.serviceEnabled();
    if (isEnabled) {
      return Future.value(true);
    }
    isEnabled = await _location.requestService();
    if (isEnabled) {
      return Future.value(true);
    }
    return Future.error('Location service not enabled');
  }

  Future<bool> checkForPermission() async {
    PermissionStatus status = await _location.hasPermission();
    switch (status) {
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.grantedLimited:
        return true;
      case PermissionStatus.denied:
        status = await _location.requestPermission();
        if (status == PermissionStatus.granted) {
          return true;
        } else {
          return false;
        }
      case PermissionStatus.deniedForever:
        Get.snackbar(
            "Permission Needed", "We use permission to give you best weather data",
            onTap: (snack) {
          handler.openAppSettings();
        }
        ).show();
        return false;
    }
  }

  Future<void> getUserLocation() async{
    LocationController controller = Get.find<LocationController>();
    controller.updateIsAccessingLocation(true);
    if (!(await checkForServiceAvailability())) {
      controller.updateIsAccessingLocation(false);
      return;
    }
    if (!(await checkForPermission())) {
      controller.updateIsAccessingLocation(false);
      return;
    }
    final LocationData data = await _location.getLocation();
    controller.updateIsAccessingLocation(false);
    controller.updateUserLocation(data);
  }
}