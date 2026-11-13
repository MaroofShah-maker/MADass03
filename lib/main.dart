import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // set to false in production
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeDrop',
      debugShowCheckedModeBanner: false,
      // Required by device_preview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB42332),
          primary: const Color(0xFFB42332),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
