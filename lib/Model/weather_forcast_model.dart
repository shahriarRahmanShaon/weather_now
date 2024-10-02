class WeatherForecast {
  String cod;
  int cnt;
  List<ForecastList> list;
  City city;

  WeatherForecast({
    required this.cod,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<ForecastList> forecastList =
    list.map((i) => ForecastList.fromJson(i)).toList();

    return WeatherForecast(
      cod: json['cod'],
      cnt: json['cnt'],
      list: forecastList,
      city: City.fromJson(json['city']),
    );
  }
}

class ForecastList {
  int dt;
  MainWeather main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  double pop;
  Rain? rain;
  Sys sys;
  String dt_txt;

  ForecastList({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.rain,
    required this.sys,
    required this.dt_txt,
  });

  factory ForecastList.fromJson(Map<String, dynamic> json) {
    var weatherList = json['weather'] as List;
    List<Weather> weather =
    weatherList.map((i) => Weather.fromJson(i)).toList();

    return ForecastList(
      dt: json['dt'],
      main: MainWeather.fromJson(json['main']),
      weather: weather,
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: json['pop'].toDouble(),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      sys: Sys.fromJson(json['sys']),
      dt_txt: json['dt_txt'],
    );
  }
}

class MainWeather {
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  int pressure;
  int sea_level;
  int grnd_level;
  int humidity;
  double temp_kf;

  MainWeather({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.sea_level,
    required this.grnd_level,
    required this.humidity,
    required this.temp_kf,
  });

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: json['temp'].toDouble(),
      feels_like: json['feels_like'].toDouble(),
      temp_min: json['temp_min'].toDouble(),
      temp_max: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      sea_level: json['sea_level'],
      grnd_level: json['grnd_level'],
      humidity: json['humidity'],
      temp_kf: json['temp_kf'].toDouble(),
    );
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      gust: json['gust'].toDouble(),
    );
  }
}

class Rain {
  double threeH;

  Rain({required this.threeH});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      threeH: json['3h'].toDouble(),
    );
  }
}

class Sys {
  String pod;

  Sys({
    required this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'],
    );
  }
}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: Coord.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class Coord {
  double lat;
  double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
    );
  }
}
