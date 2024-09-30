import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_now/View/Home/Components/weather_card.dart';
import 'package:weather_now/ViewModel/Controllers/home_controllers.dart';
import 'package:weather_now/ViewModel/Controllers/location_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationController _locationController = Get.put(LocationController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  void initState() {
    _locationController.getLocationInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Hello Arian,\nDiscover the weather',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEEF9),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFF7F6FC),
                        width: 2.0
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFEFEEF9),
                        radius: 15.0,
                          backgroundImage: AssetImage('assets/icons/search.png')
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFEFEEF9),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Color(0xFFF7F6FC),
                            width: 2.0
                        ),
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child:  CircleAvatar(
                          backgroundColor: Color(0xFFEFEEF9),
                          radius: 15.0,
                          backgroundImage: AssetImage('assets/icons/globe.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              WeatherCard(city: 'Rajshahi', temperature: '30.0', weatherCondition: 'hazr'),
              const SizedBox(height: 30),
              const Text('Around the world', style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),),
              const SizedBox(height: 10.0),
              WeatherCard(city: 'Rajshahi', temperature: '30.0', weatherCondition: 'hazr'),
              const SizedBox(height: 10.0),
              WeatherCard(city: 'Rajshahi', temperature: '30.0', weatherCondition: 'hazr'),
              const SizedBox(height: 10.0),
              WeatherCard(city: 'Rajshahi', temperature: '30.0', weatherCondition: 'hazr'),
            ],
          ),
        ),
      ),
    ));
  }
}
