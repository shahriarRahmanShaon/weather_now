import 'package:flutter/material.dart';


class WeatherCard extends StatelessWidget {
  final String city;
  final String temperature;
  final String weatherCondition;
  final String weatherImage;
  final VoidCallback onTap;

  const WeatherCard({
    super.key,
    required this.city,
    required this.temperature,
    required this.weatherCondition,
    required this.weatherImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: const Color(0xFF6151C3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getLocationText(city),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    city,
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 26),
                  Text(
                    weatherCondition,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/$weatherImage',
                    height: 120,
                    width: 120,
                  ),
                  Text(
                    '${temperature.toCelsius().toStringAsFixed(2)} °C',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  String _getLocationText(String city) {
    switch (city) {
      case 'Russia':
        return 'Russia';
      case 'Tokyo':
        return 'Japan';
      case 'Riyadh':
        return 'Saudi Arabia';
      default:
        return 'Current Location';
    }
  }
}

extension TemperatureConversion on String {
  double toCelsius() {
    try {
      double kelvin = double.parse(this);
      return kelvin - 273.15;
    } catch (e) {
      return 0.0;
    }
  }
}
