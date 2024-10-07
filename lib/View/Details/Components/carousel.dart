import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_now/Model/weather_forcast_model.dart';
import 'package:weather_now/Resources/AppConstants/app_constants.dart';
import 'package:weather_now/View/Details/Components/wind_pressure_card.dart';
import 'package:weather_now/ViewModel/Controllers/home_controllers.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  final _homeController = Get.find<HomeController>();
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    _homeController.getSevenDayForecast(_homeController.weatherModel.value?.name ?? '');
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Obx(() {
                  if (_homeController.selectedForecasts.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return PageView.builder(
                    controller: _pageController,
                    itemCount: _homeController.selectedForecasts.length,
                    itemBuilder: (context, index) {
                      double rotation = (index - currentPage) * 0.1;
                      return _buildCarouselCard(index, rotation);
                    },
                  );
                }),
              ),
              const SizedBox(height: 30),
              Container(
                height: 416,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F6FC),
                  borderRadius: BorderRadius.circular(45.0),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 25),
                      child: Text(
                        'Weather Details',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            WindPressureCard(windSpeed: 20),
                            SizedBox(width: 20),
                            WindPressureCard(windSpeed: 20),
                            SizedBox(width: 20),
                            WindPressureCard(windSpeed: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselCard(int index, double rotation) {
    var forecast = _homeController.selectedForecasts[index];
    String formattedDate = DateFormat('yyyy-MM-dd').format(
      DateTime.fromMillisecondsSinceEpoch(forecast.dt!.toInt() * 1000),
    );

    return Column(
      children: [
        Transform.rotate(
          angle: rotation,
          child: Card(
            color: const Color(0xFF6151C3),
            child: SizedBox(
              width: 270,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/${AppConstants.getWeatherImage(forecast.weather?[0].id ?? 0)}',
                        height: 150,
                        width: 150,
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${forecast.main?.temp?.toString().toCelsius().toStringAsFixed(0)}°C',
                        style: const TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        forecast.weather?[0].description ?? '',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
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
