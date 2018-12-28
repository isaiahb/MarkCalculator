import 'package:flutter/material.dart';
import 'package:grades/assignmentList.dart';
import 'models/user.dart';
import 'appBar.dart';

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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CourseMark(text: "grade", grade: "100%"),
                    CourseMark(text: "grade", grade: "100%"),
                  ],
                ),
              )
          ),
        ),
        body: AssignmentList(Course(gradables: [new Gradable(name: "test1")]))
        ),
    debugShowCheckedModeBanner: false,
    );

  }
}