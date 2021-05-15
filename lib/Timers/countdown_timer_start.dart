import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class CountdownStart extends StatefulWidget {
  CountdownStart();

  @override
  _CountdownStartState createState() => _CountdownStartState();
}

class _CountdownStartState extends State<CountdownStart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularCountDownTimer(
          duration: 2,
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,
          color: Colors.white,
          fillColor: Colors.green,
          backgroundColor: Colors.greenAccent,
          strokeWidth: 5.0,
          strokeCap: StrokeCap.butt,
          textStyle: TextStyle(
            fontSize: 22.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
          isReverse: true,
          isReverseAnimation: true,
          isTimerTextShown: true,
          onComplete: () {
            // if(routine.)
            Navigator.pushNamed(context, '/third');
          },
        ),
      ),
    );
  }
}
