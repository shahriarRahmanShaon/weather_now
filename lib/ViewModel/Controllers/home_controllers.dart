import 'package:get/get.dart';
import 'package:weather_now/Data/Network/api_services.dart';
import 'package:weather_now/Model/current_weather_model.dart';
import 'package:weather_now/Model/weather_forcast_model.dart';
import 'package:weather_now/Resources/AppConstants/app_constants.dart';
import '../../View/Home/home_screen.dart';

class HomeController extends GetxController {
  Rx<WeatherModel?> weatherModel = Rx<WeatherModel?>(null);
  var weatherDataForSpecificLocations = <String, WeatherModel>{}.obs;
  var forecastDataForSpecificLocations = <String, WeatherForecast>{}.obs;
  
  getCurrentWeatherData(String url) {
     ApiServices().getApi(url).then((value) {
       weatherModel.value = WeatherModel.fromJson(value);
     });
  }

  getWeatherDataForFixedLocations() {
    List<Map<String, dynamic>> locations = [
      {"name": "Tokyo", "lat": 35.67, "lon": 139.65},
      {"name": "Riyadh", "lat": 23.88, "lon": 45.07},
      {"name": "Russia", "lat": 61.52, "lon": 105.3},
    ];

    for (var location in locations) {
      String url = 'https://api.openweathermap.org/data/2.5/weather?lat=${location['lat']}&lon=${location['lon']}&appid=${AppConstants.apiKey}';
      ApiServices().getApi(url).then((value) {
        String key = location['name'];
        weatherDataForSpecificLocations[key] = WeatherModel.fromJson(value);
      });
    }
  }

  getSevenDayForecast(double lat, double lon) {
    String url = AppConstants.getForcastApiUrl(lat, lon);
    ApiServices().getApi(url).then((value) {
      forecastDataForSpecificLocations['locationName'] = WeatherForecast.fromJson(value);
    });
    print(forecastDataForSpecificLocations);
  }
}