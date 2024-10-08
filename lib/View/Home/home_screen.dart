import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_now/Resources/AppConstants/app_constants.dart';
import 'package:weather_now/View/Home/Components/weather_card.dart';
import 'package:weather_now/View/Search/search_screen.dart';
import 'package:weather_now/ViewModel/Controllers/home_controllers.dart';
import 'package:weather_now/ViewModel/Controllers/location_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_now/View/Details/Components/carousel.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationController _locationController = Get.put(LocationController());
  final HomeController _homeController = Get.put(HomeController());
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _locationController.getLocationInfo();
    _homeController.getWeatherDataForFixedLocations();
  }

  void _listen() async {
    _lastWords = '';
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      print('Speech initialized: $available');
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _lastWords = val.recognizedWords;
            _isListening = false;
            _speech.stop();
            _homeController.getWeatherDataForCity(_lastWords);
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      print('Listening stopped');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return Stack(
          children: [
            SafeArea(
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
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w800),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => const SearchPage());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFEEF9),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFF7F6FC),
                                    width: 2.0,
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFFEFEEF9),
                                    radius: 15.0,
                                    backgroundImage:
                                    AssetImage('assets/icons/search.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFEEF9),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFF7F6FC),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _listen();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xFFEFEEF9),
                                    radius: 15.0,
                                    child: Icon(
                                      _isListening
                                          ? Icons.mic
                                          : Icons.mic_off,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFEEF9),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFF7F6FC),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xFFEFEEF9),
                                  radius: 15.0,
                                  child: InkWell(
                                    onTap: () {
                                      _showAlertDialog(context);
                                    },
                                    child: const Icon(
                                      Icons.logout,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      WeatherCard(
                        city:
                        '${_homeController.weatherModel.value?.name ?? ''}',
                        temperature:
                        '${_homeController.weatherModel.value?.main?.temp ?? ''}',
                        weatherCondition:
                        '${_homeController.weatherModel.value?.weather?[0].description ?? ''}',
                        weatherImage: AppConstants.getWeatherImage(
                            _homeController.weatherModel.value?.weather?[0].id ??
                                0),
                        onTap: () {
                          showCupertinoModalBottomSheet(
                              context: context,
                              builder: (context) => CarouselScreen());
                        },
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Around the world',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: _showAddLocationPopup,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Column(
                        children: _homeController.weatherDataForSpecificLocations
                            .entries
                            .map((entry) {
                          return Column(
                            children: [
                              WeatherCard(
                                city: entry.key,
                                temperature:
                                '${entry.value.main?.temp ?? ''}',
                                weatherCondition:
                                '${entry.value.weather?[0].description ?? ''}',
                                weatherImage: AppConstants.getWeatherImage(
                                    entry.value.weather?[0].id ?? 0),
                                onTap: () {},
                              ),
                              const SizedBox(height: 10.0),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_locationController.isAccessingLocation.value)
              Container(
                color: Colors.black.withOpacity(0.7),
                child: const Center(
                  child: CupertinoActivityIndicator(
                    radius: 35,
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _showAddLocationPopup() {
    String enteredCity = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a City'),
          content: TextField(
            onChanged: (value) {
              enteredCity = value;
            },
            decoration: const InputDecoration(
              hintText: 'Enter city name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (enteredCity.isNotEmpty) {
                  _homeController.weatherDataAroundTheWorld.add(enteredCity);
                  _homeController.getWeatherDataForFixedLocations();
                }
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
