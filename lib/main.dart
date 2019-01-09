import 'package:flutter/material.dart';
import 'models/user.dart';
import 'course/coursePage.dart';

void main() {
  Course course = Course();
  runApp(MarkCalculator(course));
}

class MarkCalculator extends StatelessWidget {
  final Course course;
  MarkCalculator(this.course);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Course",
      home: CourseWidget(course),
      debugShowCheckedModeBanner: false,
    );
  }

}

class YearWidget extends StatefulWidget {
  @override
  _YearWidgetState createState() => _YearWidgetState();
}

class _YearWidgetState extends State<YearWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

