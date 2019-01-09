import 'package:flutter/material.dart';
import '../models/user.dart';


class CourseList extends StatefulWidget {
  final List<Course> year;

  CourseList(this.year);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {



  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: widget.year.length,
          itemBuilder: (BuildContext context, int index) {
            return CourseListTile(widget.year[index]);
          }
      ),
    );
  }
}

class CourseListTile extends StatelessWidget {
  final Course course;

  CourseListTile(this.course){print(course.name);}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(course.name),
    );
  }
}