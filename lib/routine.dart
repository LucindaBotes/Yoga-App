import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:yoga_app/Timers/countdown_continue.dart';
import 'package:yoga_app/pose.dart';
import 'package:yoga_app/state.dart';
import 'package:custom_timer/custom_timer.dart';

class RoutinePage extends StatefulWidget {
  @override
  _RoutinePageState createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  final CountdownController controller = CountdownController();
  final CustomTimerController _controller = new CustomTimerController();
  int index = 0;

  Widget bottomSheet(BuildContext context) {
    return Container(
        child: CountdownContinue(
            timerDuration: Pose.selectedTime,
            onCountdownCompleted: {
          controller.pause(),
          Navigator.pop(context)
        }));
  }

  @override
  Widget build(BuildContext context) {
    return // new WillPopScope(
        // onWillPop: () async => false,
        //child: //
        Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: routine[index].images,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    routine[index].title,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  CustomTimer(
                    controller: _controller,
                    from: Duration(seconds: routine[index].duration),
                    to: Duration(seconds: 0),
                    interval: Duration(milliseconds: 10),
                    builder: (CustomTimerRemainingTime remaining) {
                      return Text(
                        "${remaining.minutes}:${remaining.seconds}:${remaining.milliseconds}",
                        style: TextStyle(fontSize: 30.0),
                      );
                    },
                    onBuildAction: CustomTimerAction.auto_start,
                    onFinish: () {
                      if (index != routine.length - 1) {
                        setState(() {
                          index += 1;
                          _controller.pause();
                          States.routineDuration = routine[index - 1].duration -
                              routine[index].duration;
                          showModalBottomSheet(
                              context: context, builder: bottomSheet);
                          Future.delayed(Duration(seconds: Pose.selectedTime),
                              () {
                            _controller.reset();
                            _controller.start();
                          });
                        });
                      } else {
                        routine.forEach((element) {
                          element.colour = Colors.white;
                        });
                        States.routineDuration = 0;
                        routine.clear();
                        Navigator.pushNamed(context, '/fifth');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//      after each pose automatically pause for Xs, restart, start new lap.
