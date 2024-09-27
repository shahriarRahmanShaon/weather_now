class AppConstants {
  static const apiKey = '0e467e5c6beceddf2be0be537b297025';
  static String getWeatherApiUrl(double lat, double lon) {
    return 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
  }
}