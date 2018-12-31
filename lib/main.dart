import 'package:flutter/material.dart';
import 'assignmentList.dart';
import 'models/user.dart';
import 'appBar.dart';

void main() => runApp(new CourseWidget(Course(gradables: [new Gradable(name: "test2")])));

class CourseWidget extends StatefulWidget {
  Course course;
  CourseWidget(this.course);

  @override
  _CourseWidgetState createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  
  void _addGradable(){
    setState(() {
      widget.course.addGradeable("Test");
    });
  }
  
  @override
  Widget build(BuildContext context) {
//    widget.course = widget.course != null ? widget.course : Course(gradables: [new Gradable(name: "test1")]);

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
                    CourseMark(text: "Grade Avg", grade: "100%"),
                    CourseMark(text: "Culm Avg", grade: "100%"),
                  ],
                ),
              )
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: _addGradable,
        ),
        body: AssignmentList(widget.course)
        ),
    debugShowCheckedModeBanner: false,
    );

  }
}