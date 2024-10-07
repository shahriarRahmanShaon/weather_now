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
  var weatherDataAroundTheWorld = ["Tokyo"].obs;

  getCurrentWeatherData(String url) {
     ApiServices().getApi(url).then((value) {
       weatherModel.value = WeatherModel.fromJson(value);
     });
  }

  getWeatherDataForFixedLocations() {
    for (var city in weatherDataAroundTheWorld) {
      String url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${AppConstants.apiKey}';
      ApiServices().getApi(url).then((value) {
        weatherDataForSpecificLocations[city] = WeatherModel.fromJson(value);
      });
    }
  }

  getWeatherDataForCity(String cityName) {
    String url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${AppConstants.apiKey}';
    ApiServices().getApi(url).then((value) {
      weatherModel.value = WeatherModel.fromJson(value);
    });
  }

  getSevenDayForecast(double lat, double lon) {
    String url = AppConstants.getForcastApiUrl(lat, lon);
    ApiServices().getApi(url).then((value) {
      forecastDataForSpecificLocations['locationName'] = WeatherForecast.fromJson(value);
    });
    print(forecastDataForSpecificLocations);
  }
}