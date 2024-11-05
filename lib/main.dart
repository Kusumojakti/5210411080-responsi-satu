import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsi_satu/app/modules/splash_screen_view.dart';

void main() {
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('id', 'ID'),
      home: SplashScreenView(),
    ),
  );
}