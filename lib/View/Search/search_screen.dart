import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_now/Resources/AppConstants/app_constants.dart';
import 'package:weather_now/ViewModel/Controllers/home_controllers.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final HomeController _homeController = Get.find<HomeController>();
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredCities = [];

  @override
  void initState() {
    super.initState();
    _filteredCities = AppConstants.cities;
  }

  void _filterCities(String query) {
    setState(() {
      _filteredCities = AppConstants.cities
          .where((city) => city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text('Search City', style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: const Color(0xFF6151C3),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search by city name',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _filterCities(value);
              },
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  _homeController.getWeatherDataForCity(value);
                  Get.back();
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredCities[index]),
                  onTap: () {
                    String selectedCity = _filteredCities[index];
                    _homeController.getWeatherDataForCity(selectedCity);
                    Get.back();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
