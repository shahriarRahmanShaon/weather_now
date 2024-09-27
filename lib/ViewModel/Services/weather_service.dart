import 'package:get/get.dart';
import 'package:weather_now/ViewModel/Controllers/home_controllers.dart';

class WeatherService {
  getCurrentWeatherData (String url) {
    HomeController controller = Get.find<HomeController>();
    controller.getCurrentWeatherData(url);
  }
}