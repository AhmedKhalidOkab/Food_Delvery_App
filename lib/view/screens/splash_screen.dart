import 'dart:async';

import 'package:delivery_/core/animations/animations.dart';
import 'package:delivery_/core/utils/navigation.dart';
import 'package:delivery_/view/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _next();
    // TODO: implement initState
    super.initState();
  }

  _next() {
    Timer(const Duration(milliseconds: 1400), () {
      Navigation.push(
        context,
        customPageTransition: PageTransition(
            child: HomeScreen(), type: PageTransitionType.fadeIn),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Lottie.network(
                        'https://assets2.lottiefiles.com/packages/lf20_xrwurmt6.json'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    ' Delvery\' Faster in Egypt ',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
