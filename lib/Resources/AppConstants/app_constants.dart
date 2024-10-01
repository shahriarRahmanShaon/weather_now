class AppConstants {
  static const apiKey = '0e467e5c6beceddf2be0be537b297025';
  static String getWeatherApiUrl(double lat, double lon) {
    return 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
  }

  static String getWeatherImage(num code) {
    if (code >= 200 && code <= 232) {
      return 'CloudThreeZap.png';
    } else if (code >= 300 && code <= 321) {
      return 'SunCloudHailstone.png';
    } else if (code >= 500 && code <= 531) {
      return 'CloudLittleRain.png';
    } else if (code >= 600 && code <= 622) {
      return 'BigSnowLittleSnow.png';
    } else if (code >= 801 && code <= 804) {
      return 'SuncloudBigRain.png';
    } else if (code == 800){
      return 'Sun.png';
    } else {
      return 'MoonCloudZap.png';
    }
  }

}