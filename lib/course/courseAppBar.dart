import 'package:flutter/material.dart';


class CourseMark extends StatefulWidget {
  CourseMark({
    Key key,
    @required this.grade,
    @required this.text
  }) : super(key: key);

  final String text;
  final String grade;

  @override
  CourseMarkState createState() {
    return new CourseMarkState();
  }
}

class CourseMarkState extends State<CourseMark> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(child: Column(
        children: <Widget>[
          Text(widget.text, style: Theme.of(context).primaryTextTheme.body1),
          Text(widget.grade, style: Theme.of(context).primaryTextTheme.headline)
        ],
      ),),
    );
  }
}