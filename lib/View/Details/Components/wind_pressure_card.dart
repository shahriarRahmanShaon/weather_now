import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

enum WeatherType {
  wind,
  pressure,
  humidity,
  tempMin,
  tempMax,
}

class WeatherCard extends StatelessWidget {
  final double? windValue;
  final double? pressureValue;
  final double? humidityValue;
  final double? tempMinValue;
  final double? tempMaxValue;
  final WeatherType weatherType;

  WeatherCard({
    this.windValue,
    this.pressureValue,
    this.humidityValue,
    this.tempMinValue,
    this.tempMaxValue,
    required this.weatherType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent,
                    radius: 20,
                    child: Icon(
                      _getIcon(),
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    _getTitle(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (weatherType == WeatherType.tempMin || weatherType == WeatherType.tempMax)
                _buildTemperatureWidget()
              else
                _buildGaugeWidget(),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (weatherType) {
      case WeatherType.wind:
        return Icons.air_rounded;
      case WeatherType.pressure:
        return Icons.speed_rounded;
      case WeatherType.humidity:
        return Icons.water_drop_rounded;
      case WeatherType.tempMin:
      case WeatherType.tempMax:
        return Icons.thermostat_rounded;
      default:
        return Icons.help;
    }
  }

  String _getTitle() {
    switch (weatherType) {
      case WeatherType.wind:
        return 'Wind';
      case WeatherType.pressure:
        return 'Pressure';
      case WeatherType.humidity:
        return 'Humidity';
      case WeatherType.tempMin:
        return 'Min Temp';
      case WeatherType.tempMax:
        return 'Max Temp';
      default:
        return '';
    }
  }

  Widget _buildTemperatureWidget() {
    double? value = weatherType == WeatherType.tempMin ? tempMinValue : tempMaxValue;
    return Center(
      child: Column(
        children: [
          Text(
            value != null ? value.toStringAsFixed(0) : 'N/A',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '°C',
            style: TextStyle(
              fontSize: 16,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGaugeWidget() {
    double? value;
    switch (weatherType) {
      case WeatherType.wind:
        value = windValue;
        break;
      case WeatherType.pressure:
        value = pressureValue;
        break;
      case WeatherType.humidity:
        value = humidityValue;
        break;
      default:
        value = 0.0;
    }

    return Center(
      child: Container(
        height: 200,
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              startAngle: 180,
              endAngle: 0,
              showTicks: false,
              showLabels: false,
              axisLineStyle: AxisLineStyle(
                thickness: 0.1,
                thicknessUnit: GaugeSizeUnit.factor,
                color: Colors.deepPurpleAccent.withOpacity(0.2),
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: value ?? 0.0,
                  width: 0.1,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: Colors.deepPurpleAccent,
                  cornerStyle: CornerStyle.bothCurve,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        value != null ? value.toStringAsFixed(0) : 'N/A',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      Text(
                        _getUnit(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    ],
                  ),
                  positionFactor: 0.1,
                  angle: 90,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getUnit() {
    switch (weatherType) {
      case WeatherType.wind:
        return 'mph';
      case WeatherType.pressure:
        return 'hPa';
      case WeatherType.humidity:
        return '%';
      default:
        return '';
    }
  }
}
