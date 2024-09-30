import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_now/View/Authentication/authentication_view.dart';

class SignupLoginCard extends StatelessWidget {
  const SignupLoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 361,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Explore global map of wind, weather, and ocean conditions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15.0),
              const Text(
                'Planning your trip becomes easier with Ideate Weather App. Instantly see the whole world’s weather in a few seconds.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.to (()=> const AuthenticationView(caller: AuthenticationCaller.getStarted));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6151C3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: const Text('Get Started', style: TextStyle(
                  color: Colors.white,
                ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Get.to (()=> const AuthenticationView(caller: AuthenticationCaller.login));
                    },
                    child: const Text('Log in', style: TextStyle(color: Color(0xFF6151C3)),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
