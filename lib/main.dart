import 'package:flutter/material.dart';
import 'models/user.dart';

import 'year/courseList.dart';

void main() {
  List<Course> year = [new Course(name: "Math"), new Course(name: "Chemistry")];
  runApp(MarkCalculator(year));
}

class MarkCalculator extends StatelessWidget {
  final List<Course> year;
  MarkCalculator(this.year);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Course",
      home: YearWidget(year),
      debugShowCheckedModeBanner: false,
    );
  }

}

class YearWidget extends StatefulWidget {
  final List<Course> year;

  YearWidget(this.year);

  @override
  _YearWidgetState createState() => _YearWidgetState();
}

class _YearWidgetState extends State<YearWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseList(widget.year),
      appBar: AppBar(
        leading: BackButton(),
        centerTitle: true,
        title: Text("Year"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        child: Icon(Icons.add),
        onPressed: (){}
      ),
    );
  }
}
