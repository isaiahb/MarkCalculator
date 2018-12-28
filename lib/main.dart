import 'package:flutter/material.dart';
import 'package:grades/assignmentList.dart';
import 'models/user.dart';

void main() => runApp(new Course());

class Course extends StatefulWidget {
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {

  Course course;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Course",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Course"),
          leading: BackButton(),
        ),
        body: AssignmentList()
      ),
    debugShowCheckedModeBanner: false,
    );
  }
}

class CourseGrade extends StatefulWidget {
  @override
  _CourseGradeState createState() => _CourseGradeState();
}

class _CourseGradeState extends State<CourseGrade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}


