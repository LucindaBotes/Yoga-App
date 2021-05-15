import 'package:flutter/material.dart';
import 'package:yoga_app/Timers/countdown_timer_start.dart';
import 'package:flutter/cupertino.dart';
import 'package:yoga_app/pauseAmount.dart';
import 'package:yoga_app/homePage.dart';
import 'package:yoga_app/congratulations.dart';
import 'package:yoga_app/routine.dart';
import 'package:yoga_app/Timers/customTimer.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder( //return LayoutBuilder
        builder: (context, constraints) {
          return OrientationBuilder( //return OrientationBuilder
              builder: (context, orientation) {
                SizerUtil().init(constraints, orientation);
                return MaterialApp(
                  title: 'Yoga App',
                  theme: ThemeData(
                    primarySwatch: Colors.green,
                    splashColor: Colors.greenAccent,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                  initialRoute: '/',
                  routes: {
                    '/': (context) => MyHomePage(),
                    '/first': (context) => PauseAmount(),
                    '/second': (context) => CountdownStart(),
                    '/third': (context) => RoutinePage(),
                    '/fifth': (context) => CongratulationsPage(),
                    '/sixth': (context) => CustomCountdownTimer(),
                  },
                );
              }
          );
        }
    );
  }
}
