import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String city;
  final String temperature;
  final String weatherCondition;

  WeatherCard({
    required this.city,
    required this.temperature,
    required this.weatherCondition,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                const Text('Current location', style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),),
                Text(city, style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white
                ),),
                const SizedBox(height: 26),
                Text(weatherCondition, style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Image.asset('assets/icons/CloudThreeZap.png', height: 100, width: 100,),
                Text(temperature + '"C', style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),),
              ],
            )
          ],
        )
      ),
    );
  }
}
