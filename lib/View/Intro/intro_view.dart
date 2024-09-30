import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_now/View/Intro/Components/signup_login_card.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SVG Background Image
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/icons/intro.svg',
              fit: BoxFit.cover, // Makes sure the SVG fills the entire background
            ),
          ),
          const Positioned(
            bottom: 30.0, // Controls how far the card is from the bottom
            left: 20.0,
            right: 20.0,
            child: SignupLoginCard(), // The card widget
          ),
        ],
      ),
    );
  }
}
