import 'package:flutter/material.dart';
import 'package:grades/assignmentList.dart';
import 'models/user.dart';

void main() => runApp(new CourseWidget());

class CourseWidget extends StatefulWidget {
  @override
  _CourseWidgetState createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
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
