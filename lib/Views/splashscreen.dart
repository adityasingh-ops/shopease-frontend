import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopease/Views/Profile/Widget/login_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shopease/Views/entrypoint.dart';
import 'package:shopease/constants/constants.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return AnimatedSplashScreen(
      splash: 'assets/images/Checkmark.png',
      splashTransition: SplashTransition.rotationTransition,
      animationDuration: const Duration(seconds: 2),
      centered: true,
      duration: 2000,
      backgroundColor: kPrimary,
      nextScreen: FutureBuilder<bool>(
        future: _checkIfRegistered(), // Call the function to check if the user is registered
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while checking the user's registration status
            return Container(
              color: kPrimary,  // You can change the color as per your preference
              child: const Center(
                child: CircularProgressIndicator(), // Show a circular progress indicator
              ),
            );
          } else {
            if (snapshot.hasError) {
              // Handle errors if any
              return Container(
                color: kPrimary, // You can change the color as per your preference
                child: Center(
                  child: Text('Error: ${snapshot.error}'), // Display the error message
                ),
              );
            } else {
              // Check if the user is registered
              bool isRegistered = snapshot.data ?? false; // Get the registration status
              return isRegistered ? MainScreen() : const LoginPage(); // Navigate to the appropriate screen
            }
          }
        },
      ),
    );
  }
  Future<bool> _checkIfRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isRegistered = prefs.getBool('isRegistered');
    return isRegistered ?? false; // Return false if not registered or null
  }
}
