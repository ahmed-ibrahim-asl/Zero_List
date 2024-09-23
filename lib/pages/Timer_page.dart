import 'package:flutter/material.dart';



class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  bool isFocusPeriod = true; 


  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Text(
              "Level 0",
              style: TextStyle(color: Colors.white, fontSize: 24)
            ),

            SizedBox(height: 10),

            Text(
              'Focus Time',
              style: TextStyle(color: Colors.white, fontSize: 24)
            ),

            /******** Time Section ********/
            /******************************/

            SizedBox(height: 20),


          ],
        )
      )
    );
  }
}