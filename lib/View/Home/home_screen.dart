import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_now/Resources/AppConstants/app_constants.dart';
import 'package:weather_now/ViewModel/Controllers/home_controllers.dart';
import 'package:weather_now/ViewModel/Controllers/location_controller.dart';
import 'package:weather_now/ViewModel/Services/weather_service.dart';

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
      appBar: AppBar(
        title: const Text('Weather from info'),
      ),
      body: Obx( () {
        return Column (
          children: [
            Text(
             '${_homeController.weatherModel.value?.name}'
            )
          ],
        );
      }),
    );
  }
}



