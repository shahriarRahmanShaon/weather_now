import 'package:get/get.dart';
import 'package:weather_now/Data/Network/api_services.dart';
import 'package:weather_now/Model/current_weather_model.dart';
import '../../View/Home/home_screen.dart';

class HomeController extends GetxController {
  Rx<WeatherModel?> weatherModel = Rx<WeatherModel?>(null);

  getCurrentWeatherData(String url) {
     ApiServices().getApi(url).then((value) {
       weatherModel.value = WeatherModel.fromJson(value);
     });
  }
}