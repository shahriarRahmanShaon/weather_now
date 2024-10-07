class AppConstants {
  static const apiKey = '0e467e5c6beceddf2be0be537b297025';

  static String getWeatherApiUrl(double lat, double lon) {
    return 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
  }

  static String getForcastApiUrl(String city) {
    return 'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey';
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

  static const List<String> cities = [
    'London', 'New York', 'Tokyo', 'Riyadh', 'Moscow', 'Sydney', 'Berlin',
    'Paris', 'Los Angeles', 'Mumbai', 'Delhi', 'Beijing', 'Shanghai', 'Cairo',
    'Dubai', 'Singapore', 'Mexico City', 'Lagos', 'Buenos Aires', 'Istanbul',
    'Johannesburg', 'Seoul', 'Bangkok', 'Kuala Lumpur', 'Rome', 'Madrid',
    'Chicago', 'Toronto', 'Vancouver', 'Melbourne', 'Perth', 'Brisbane',
    'Cape Town', 'Dublin', 'Zurich', 'Vienna', 'Lisbon', 'Helsinki', 'Oslo',
    'Stockholm', 'Warsaw', 'Budapest', 'Prague', 'Athens', 'Copenhagen',
    'Santiago', 'Bogota', 'Rio de Janeiro', 'Sao Paulo', 'Lima', 'Havana',
    'Caracas', 'Manila', 'Jakarta', 'Hanoi', 'Kolkata', 'Karachi',
    'Lahore', 'Islamabad', 'Kabul', 'Tehran', 'Baghdad', 'Beirut', 'Amman',
    'Jerusalem', 'Damascus', 'Addis Ababa', 'Accra', 'Nairobi', 'Algiers',
    'Casablanca', 'Rabat', 'Tunis', 'Tripoli', 'Kigali', 'Luanda', 'Yaounde',
    'Kinshasa', 'Maputo', 'Harare', 'Pretoria', 'Windhoek', 'Banjul', 'Freetown',
    'Monrovia', 'Abuja', 'Dakar', 'Nouakchott', 'Mogadishu', 'Djibouti', 'Muscat'
  ];

}