import 'package:flutter/material.dart';
import 'package:yoga_app/pose.dart';
import 'package:yoga_app/state.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  void play() {
    Navigator.pushNamed(context, '/first'); // CountdownStart()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create  Custom Yoga Routine"),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            poses.length, (index){
              return Card(
                child: FlatButton(
                  color: poses[index].colour,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: poses[index].images,
                      ),
                      Text(
                        poses[index].title,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10,),
                      Text("${poses[index].duration}s", style: TextStyle(fontSize: 15),),
                      SizedBox(height: 10,),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      poses[index].colour =
                      (poses[index].colour == Colors.white)
                          ? Colors.greenAccent
                          : Colors.white;
                      if (poses[index].colour == Colors.greenAccent) {
                        routine.add(poses[index]);
                        States.routineDuration += routine.firstWhere((pose) => pose.title == poses[index].title).duration;
                      } else {
                        States.routineDuration -= routine.firstWhere((pose) => pose.title == poses[index].title).duration;
                        routine.removeWhere((pose) => pose.title == poses[index].title);
                      }
                    });
                  }
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: "Start",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label:States.routineDuration.toString(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.undo),
            label: "Clear",
          ),
        ],
        onTap: (int index) {
          setState(() {
            switch (index) {
              case 0:
                {
                  routine.isEmpty ? print("error!") : play();
                }
                break;
              case 2:
                {
                  States.routineDuration = 0;
                  routine.forEach((element) {
                    element.colour = Colors.white;
                  });
                  routine.clear();
                }
                break;
              default:
                {}
                break;
            }
          });
        },
      ),
    );
  }
}
