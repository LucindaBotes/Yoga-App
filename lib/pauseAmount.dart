import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yoga_app/pose.dart';
import 'package:yoga_app/state.dart';
import 'package:sizer/sizer.dart';

class PauseAmount extends StatefulWidget {
  @override
  _PauseAmountState createState() => _PauseAmountState();
}

class _PauseAmountState extends State<PauseAmount> {
  List<Widget> getPickerItems() {
    List<Widget> pickerItems = [];
    for (int seconds in secondsList) {
      pickerItems.add(
        Text(seconds.toString()),
      );
    }
    return pickerItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              child: Text(
                "Time between poses",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              width: 30.0.w,
              height: 10.0.h,
              child: CupertinoPicker(
                itemExtent: 32.0,
                backgroundColor: Colors.greenAccent,
                onSelectedItemChanged: (selectedIndex) {
                  Pose.selectedTime = secondsList[selectedIndex];
                  Pose.totalTime = (routine.length * Pose.selectedTime) +
                      States.routineDuration;
                },
                children: getPickerItems(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
                child: Text(
                  'Start Routine',
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                })
          ],
        ),
      ),
    );
  }
}

List<int> secondsList = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
];
