import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsi_satu/app/modules/login_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    var duration = const Duration(seconds: 5);
    Timer(duration, () {
      Get.off(
          () => const LoginView()); // Replace the Splash screen with LoginView
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 252,
              height: 96,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
