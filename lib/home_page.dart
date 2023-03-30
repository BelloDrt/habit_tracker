// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/util/habit_tiles.dart';
import 'package:habit_tracker/util/theme/colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //overall habitList
  List habitList = [
    // [habitName, habitStarted, timeStarted, timeSpent(sec), timeGoal(mins)]
    ["Exercise", false, 0, 10],
    ["Read", false, 0, 5],
    ["Meditate", false, 0, 2],
    ["Code", false, 0, 8],
  ];
  void habitStarted(int index) {

    //know what the start time is
    var startTime = DateTime.now();

    // include the time that already elapsed

    int elapsedTime = habitList[index] [2];


    //habit started or stopped
    setState(() {
      habitList[index] [1] =!habitList[index] [1];
    });

   if (habitList[index] [1]) {
     //keep the time going
     Timer.periodic(Duration(seconds: 1), (timer) {
       setState(() {
         // check when the user has stopped the timer
         if (!habitList[index] [1]) {
           timer.cancel();
         }

         //calculate time elapsed by comparing current time and start time

         var currentTime = DateTime.now();
         habitList[index] [2] = elapsedTime +
             currentTime.second -
             startTime.second +
             60*(currentTime.minute - startTime.minute) +
             60*60*(currentTime.hour - startTime.hour);




       });
     });
   }

  }
  void settingsOpened(int index) {
    showDialog(
        context: context,
        builder: (context) {
         return AlertDialog(
           title: Text("Settings for " + habitList[index] [0]),
         ) ;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.deepPurple.shade200,
        items: <Widget>[
          Icon(Icons.home_filled, size: 30, color: Colors.white),
          Icon(Icons.menu, size: 30, color: Colors.white),
          Icon(Icons.bar_chart, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("Consistency is Key",
        style: TextStyle(
          color: Colors.black54
        )),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.grey,
                    title: Text("you have 0 notifications"),
                  );
                });
          },
              icon: Icon(Icons.notifications,
              size: 30,
              color: myblack),
          )
        ],

      ),
      body: ListView.builder(
        itemCount: habitList.length,
        itemBuilder: ((context, index) {
        return HabitTile(
            habitName: habitList[index] [0],
            onTap: () {
              habitStarted(index);
            },
            settingsTapped: () {
              settingsOpened(index);
            },
            habitStarted: habitList[index] [1],
            timeSpent: habitList[index] [2],
            timeGoal: habitList[index] [3],

        );

    }),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple.shade300,
        elevation: 0.0,
        child: Icon(Icons.check,
        ),
        onPressed: () {
          //do something later

        },
      ),
    );

  }
}
