// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:habit_tracker/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            
            width: w,
            height: h*0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/welcomepage.png"
                ),
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(height: 150),
          Container(
            child: Column(
              children: [
                Text("Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35
                ),),
              ],
            ),
          ),
          SizedBox(height: 150),

          Container(
            width: w*0.5,
            height: h*0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
               image: AssetImage("assets/images/signin.png"),
                fit: BoxFit.cover
              ),
            ),
            child: GestureDetector(
              onTap: () {
                //Route to main app
                Get.to( () => HomePage(), transition: Transition.zoom);

              },

              child: Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
