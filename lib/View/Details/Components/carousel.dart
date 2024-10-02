import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_now/View/Details/Components/wind_pressure_card.dart';

class CarouselScreen extends StatefulWidget {
  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
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
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    double rotation = (index - currentPage) * 0.1;
                    return _buildCarouselCard(index, rotation);
                  },
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 416,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F6FC),
                  borderRadius: BorderRadius.circular(45.0)
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 25),
                      child: Text('Weather Details', style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                      ),),
                    ),
                    //Spacer(),
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
                            WindPressureCard(windSpeed: 20)
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
    return Column(
      children: [
        Transform.rotate(
          angle: rotation,
          child: Card(
            color: const Color(0xFF6151C3),
            child: SizedBox(
              width: 270,
              //height: 350,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/Sun.png',
                        height: 150,
                        width: 150,
                      ),
                      const Text(
                        'Rampura, Dhaka',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        '20°C',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Softly Coldy',
                        style: TextStyle(
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
