import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/bindings/home_binding.dart';
import 'package:health_app/screens/home/home.dart';
import 'package:health_app/screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Health App',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.route,
      getPages: [
        GetPage(
          name: Splash.route,
          page: () => const Splash(),
        ),
        GetPage(
          name: Home.route,
          page: () => const Home(),
          binding: HomeBinding(),
          transition: Transition.cupertino,
        ),
      ],
    );
  }
}
