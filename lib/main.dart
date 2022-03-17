import 'package:delivery_/core/theme/app_theme.dart';
import 'package:delivery_/core/utils/size_config.dart';
import 'package:delivery_/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizeConfiguration(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery ',
        theme: AppTheme.light(),
        home: const SplashScreen(),
      ),
    );
  }
}
