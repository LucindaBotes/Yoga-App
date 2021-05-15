import 'package:flutter/material.dart';

class CongratulationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("🏆", style: TextStyle(fontSize: 50, color: Colors.amber),),
            SizedBox(height: 30,),
            Text(
              "Congratulations",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 30,),
            FlatButton(
                child: Text("Go Back To Home Page", style: TextStyle(fontSize: 20),),
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                }),
          ]),
        ),
      ),
    );
  }
}
