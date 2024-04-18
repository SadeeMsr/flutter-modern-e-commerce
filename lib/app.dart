import 'package:e_commerce/features/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:get/get.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}