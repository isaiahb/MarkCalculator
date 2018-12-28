import 'package:flutter/material.dart';
import 'package:grades/assignmentList.dart';

void main() => runApp(new Course());

class Course extends StatefulWidget {
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Course",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hi"),
        ),
        body: AssignmentList(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}



