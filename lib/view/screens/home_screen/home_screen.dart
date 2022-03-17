// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:delivery_/core/animations/animations.dart';
import 'package:delivery_/core/utils/ui_helper.dart';
import 'package:delivery_/core/utils/utils.dart';
import 'package:delivery_/model/data.dart';
import 'package:delivery_/view/screens/vendor_screen/vendor_screen.dart';
import 'package:delivery_/view/widgets/app_bar/custom_app_bar.dart';
import 'package:delivery_/view/widgets/category_items.dart';
import 'package:delivery_/view/widgets/clipedcontainer.dart';
import 'package:delivery_/view/widgets/vendor_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double _height;

  final _duration = const Duration(milliseconds: 750);
  final _psudoDuration = const Duration(milliseconds: 150);

  _navigate() async {
    //Animate screen container from bottom to top
    await _animateContainerFromBottomToTop();

    await Navigation.push(
      context,
      customPageTransition: PageTransition(
        child: const VendorScreen(),
        type: PageTransitionType.fadeIn,
      ),
    );

    await _animateContainerFromTopToBottom();
  }

  _animateContainerFromBottomToTop() async {
    //Animate back to default value
    _height = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});

    //Wait till animation is finished
    await Future.delayed(_duration);
  }

  _animateContainerFromTopToBottom() async {
    //Wait
    await Future.delayed(_psudoDuration);

    //Animate from top to bottom
    _height = MediaQuery.of(context).size.height;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //Default height
    _height = 0;
    setState(() {});

    //Animate Container from Top to bottom
    Timer(const Duration(milliseconds: 50), () {
      _animateContainerFromTopToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideAnimation(
          begin: const Offset(0, 400),
          duration: const Duration(milliseconds: 750),
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 750,
            ),
            padding: const EdgeInsets.only(bottom: 20),
            curve: Curves.fastOutSlowIn,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(
                    hasBackButton: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: space2x,
                    ),
                    child: RichText(
                      text: TextSpan(
                          text: 'Hi,',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal,
                                  ),
                          children: [
                            TextSpan(
                              text: 'Ahmed Khalid',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 24,
                                  ),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: space3x,
                    ),
                    child: Text(
                      'Deliver to El-Moqttam, Cairo ,Egypt',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                          ),
                    ),
                  ),
                  SizedBox(height: rh(space4x)),
                  ClippedContainer(
                    height: rh(120),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: const CategoryListView(),
                  ),
                  SizedBox(height: rh(space5x)),
                  FadeAnimation(
                    intervalStart: 0.4,
                    duration: const Duration(milliseconds: 1250),
                    child: SlideAnimation(
                      begin: const Offset(0, 100),
                      intervalStart: 0.4,
                      duration: const Duration(milliseconds: 1250),
                      child: ListView.separated(
                        itemCount: vendorList.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: rh(space4x),
                            endIndent: rw(20),
                            indent: rw(20),
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: _navigate,
                            child: VendorCard(
                              imagePath: vendorList[index]['imagePath'],
                              name: vendorList[index]['name'],
                              rating: vendorList[index]['rating'].toString(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
