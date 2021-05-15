import 'package:flutter/material.dart';

class Pose {
  static int selectedTime = 1;
  static int totalTime = 0;
  Pose({this.title, this.images, this.duration, this.colour, this.level});

  final String title;
  final Image images;
  final int duration;
  final String level;
  Color colour;
}

List<Pose> poses = <Pose>[
  Pose(
    title: 'Belly Twist',
    images: Image.asset('images/icons/BellyTwistPose.png'),
    duration: 1,
    colour: Colors.white,
    level: 'beginner',
  ),
  Pose(
    title: 'Bound Angle',
    images: Image.asset('images/icons/BoundAnglePose.png'),
    duration: 2,
    colour: Colors.white,
    level: 'beginner',
  ),
  Pose(
    title: 'Bow',
    images: Image.asset('images/icons/BowPose.png'),
    duration: 3,
    colour: Colors.white,
    level: 'beginner',
  ),
  Pose(
    title: 'Camel',
    images: Image.asset('images/icons/CamelPose.png'),
    duration: 4,
    colour: Colors.white,
    level: 'beginner',
  ),
];

List<Pose> routine = <Pose>[];
