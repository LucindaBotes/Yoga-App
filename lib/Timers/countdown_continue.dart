import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:timer_count_down/timer_controller.dart';

class CountdownContinue extends StatefulWidget {
  final int timerDuration;
  final void onCountdownCompleted;
  CountdownContinue(
      {@required this.timerDuration, @required this.onCountdownCompleted});

  @override
  _CountdownContinueState createState() => _CountdownContinueState();
}

class _CountdownContinueState extends State<CountdownContinue> {
  final CountdownController controller = CountdownController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularCountDownTimer(
          // duration: timerDuration,
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,
          color: Colors.white,
          fillColor: Colors.green,
          backgroundColor: Colors.greenAccent,
          strokeWidth: 5.0,
          strokeCap: StrokeCap.butt,
          textStyle: TextStyle(
              fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
          isReverse: true,
          isReverseAnimation: true,
          isTimerTextShown: true,
          // onComplete: onCountdownCompleted,
        ),
      ),
    );
  }
}
