import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WindPressureCard extends StatelessWidget {
  final double windSpeed;

  const WindPressureCard({
    super.key,
    required this.windSpeed,
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
              const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent,
                    radius: 20,
                    child: Icon(
                      Icons.air_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Wind',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Center(
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
                            value: windSpeed,
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
                                  windSpeed.toStringAsFixed(0),
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                                const Text(
                                  'mph',
                                  style: TextStyle(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
