class WeatherForecast {
  String? cod;
  num? cnt;
  List<ForecastList>? list;
  City? city;

  WeatherForecast({
    this.cod,
    this.cnt,
    this.list,
    this.city,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List?;
    List<ForecastList> forecastList =
    list != null ? list.map((i) => ForecastList.fromJson(i)).toList() : [];

    return WeatherForecast(
      cod: json['cod'],
      cnt: json['cnt'],
      list: forecastList,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
    );
  }
}

class ForecastList {
  num? dt;
  MainWeather? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  num? visibility;
  num? pop;
  Rain? rain;
  Sys? sys;
  String? dt_txt;

  ForecastList({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dt_txt,
  });

  factory ForecastList.fromJson(Map<String, dynamic> json) {
    var weatherList = json['weather'] as List?;
    List<Weather> weather = weatherList != null
        ? weatherList.map((i) => Weather.fromJson(i)).toList()
        : [];

    return ForecastList(
      dt: json['dt'],
      main: json['main'] != null ? MainWeather.fromJson(json['main']) : null,
      weather: weather,
      clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      visibility: json['visibility'],
      pop: json['pop']?.toDouble(),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
      dt_txt: json['dt_txt'],
    );
  }
}

class MainWeather {
  num? temp;
  num? feels_like;
  num? temp_min;
  num? temp_max;
  num? pressure;
  num? sea_level;
  num? grnd_level;
  num? humidity;
  num? temp_kf;

  MainWeather({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.sea_level,
    this.grnd_level,
    this.humidity,
    this.temp_kf,
  });

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: json['temp'],
      feels_like: json['feels_like'],
      temp_min: json['temp_min'],
      temp_max: json['temp_max'],
      pressure: json['pressure'],
      sea_level: json['sea_level'],
      grnd_level: json['grnd_level'],
      humidity: json['humidity'],
      temp_kf: json['temp_kf'],
    );
  }
}

class Weather {
  num? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
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
  num? all;

  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }
}

class Wind {
  num? speed;
  num? deg;
  num? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
      gust: json['gust'],
    );
  }
}

class Rain {
  num? threeH;

  Rain({this.threeH});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      threeH: json['3h'],
    );
  }
}

class Sys {
  String? pod;

  Sys({
    this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'],
    );
  }
}

class City {
  num? id;
  String? name;
  Coord? coord;
  String? country;
  num? population;
  num? timezone;
  num? sunrise;
  num? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class Coord {
  num? lat;
  num? lon;

  Coord({
    this.lat,
    this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}
