// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final VoidCallback onTap;
  final VoidCallback settingsTapped;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;


  const HabitTile({Key? key,
    required this.habitName,
    required this.onTap,
    required this.settingsTapped,
    required this.timeSpent,
    required this.timeGoal,
    required this.habitStarted,

  }) : super(key: key);
  
  // convert seconds into minu:sec 
  
  String formatToMinSec(int totalSeconds) {
    String secs = (totalSeconds % 60).toString();
    String mins = (totalSeconds / 60).toStringAsFixed(5);

    // if seconds is 1 digit number, add a place of 0 in front of it

    if(secs.length == 1) {
      secs = "0" + secs;
    }
    
    //if mins is 1 digit number
    if (mins[1]== ".") {
      mins = mins.substring(0, 1);
    }
    return mins + ":" + secs;
  }

  // calculate progress percentage
  double percentCompleted() {
    return timeSpent / (timeGoal*60);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 3)
            )
          ],
          color: Colors.deepPurple[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                   GestureDetector(
                     onTap: onTap,
                       child: Padding(
                         padding: const EdgeInsets.only(left: 15.0),
                         child: Container(
                           height: 64,
                           width: 64,
                           child: Stack(children: [
                             //progress Circle
                             CircularPercentIndicator(
                               radius: 30,
                               percent: percentCompleted() < 1 ? percentCompleted() : 1,
                               progressColor: percentCompleted() > 0.5
                                   ? (percentCompleted() > 0.75 ? Colors.green.shade700 :
                                   Colors.orange)
                                   : Colors.red,
                             ),
                             //play pause button
                           Center(
                             child: Icon(habitStarted ? Icons.pause : Icons.play_arrow,
                               size: 20,
                               ),
                           ),

                           ],
                           ),
                         ),
                       ),

                   ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //habit name
                        Text(habitName, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                        ),),
                        const SizedBox(height: 4),
                        //progress bar
                        Text(
                          formatToMinSec(timeSpent) +
                              " / " + timeGoal.toString() +
                              " = " + (percentCompleted() * 100).toStringAsFixed(0) +
                              "%",
                          style: TextStyle(
                              color: Colors.white70
                          ),),
                      ],
                    ),


              ],
            ),
            GestureDetector(
              onTap: settingsTapped,
                child: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
