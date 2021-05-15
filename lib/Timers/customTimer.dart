import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';

class CustomCountdownTimer extends StatefulWidget {
  @override
  _CustomCountdownTimerState createState() => _CustomCountdownTimerState();
}

class _CustomCountdownTimerState extends State<CustomCountdownTimer> {
  final CustomTimerController _controller = new CustomTimerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomTimer(
        controller: _controller,
        from: Duration(hours: 12),
        to: Duration(hours: 0),
        interval: Duration(seconds: 1),
        builder: (CustomTimerRemainingTime remaining) {
          return Text(
            "${remaining.hours}:${remaining.minutes}:${remaining.seconds}",
            style: TextStyle(fontSize: 30.0),
          );
        },
      ),
    );
  }
}
