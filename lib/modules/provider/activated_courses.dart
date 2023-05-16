import 'package:flutter/widgets.dart';

import '../course.dart';

class CoursesActvated extends Course {
  late int lessonsCompleted = 0;
  late Duration timeSpended;

  CoursesActvated(
      {required this.lessonsCompleted,
      required this.timeSpended,
      required super.id,
      required super.descrpition,
      required super.cardColor,
      required super.name,
      required super.numberLecture,
      required super.timeLectures,
      required super.typeCourse});

  void updateCourse() {
    lessonsCompleted++;
    //Duration++;
  }
}