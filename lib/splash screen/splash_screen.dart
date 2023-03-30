// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker/features/splash_screen_controller.dart';
import 'package:habit_tracker/splash%20screen/colors.dart';
import 'package:habit_tracker/splash%20screen/image_strings.dart';
import 'package:habit_tracker/splash%20screen/sizes.dart';
import 'package:habit_tracker/splash%20screen/text_screen.dart';
import 'package:habit_tracker/splash%20screen/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Obx(
            () => AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
                top: splashController.animate.value ? 0 : -30,
                left: splashController.animate.value ? 0 : -30,
                child: Image(image: AssetImage(tSplashTopIcon),
                  width: 180,
                  height: 180,
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
                top: 150,
                left: splashController.animate.value ? 80 : -80,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 1600),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tAppName,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),),
                      Text(tAppTagLine,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),)
                    ],
                  ),
                )
            ),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: Duration(milliseconds: 2400),
                bottom: splashController.animate.value ? 100 : 0,
                left: 10,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 2000),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Image(image: AssetImage(tSplashImage),
                    width: 500,
                    height: 500,
                  ),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: Duration(milliseconds: 2400),
                bottom: splashController.animate.value ? 40 : 0,
                right: tDefaultsize,
                child: Image(image: AssetImage(tSplashTopIcon),
                  width: 80,
                  height: 80,
                )
            ),
          ),
        ],
      ),
    );
  }


}