import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:weather_now/Resources/AppConstants/app_constants.dart';
import 'package:weather_now/ViewModel/Services/location_service.dart';
import 'package:weather_now/ViewModel/Services/weather_service.dart';

class LocationController extends GetxController {
  final RxBool isAccessingLocation = RxBool(false);
  final Rx<LocationData?> userLocation = Rx<LocationData?>(null);

  void updateIsAccessingLocation(bool b) {
    isAccessingLocation.value = b;
  }
  void updateUserLocation(LocationData data) {
    userLocation.value = data;
    WeatherService().getCurrentWeatherData(
        AppConstants.getWeatherApiUrl(
            userLocation.value!.latitude ?? 0.0,
            userLocation.value!.longitude ?? 0.0));
  }
  void getLocationInfo() {
    LocationService.instance.getUserLocation();
  }
}