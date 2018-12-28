import 'package:flutter/material.dart';
import 'models/user.dart';


class AssignmentList extends StatefulWidget {
  final Course course;
  AssignmentList(@required this.course);

  @override
  _AssignmentListState createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder
        (
          itemCount: widget.course.gradables.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return new AssignmentWidget(gradable: widget.course.gradables[index]);
          }
      ),
    );
  }
}

class AssignmentWidget extends StatefulWidget {
  final Gradable gradable;
  AssignmentWidget({this.gradable});

  @override
  _AssingmentState createState() => new _AssingmentState();
}

class _AssingmentState extends State<AssignmentWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Row(
        children: <Widget>[
          Text(widget.gradable.name),
          Text(widget.gradable.grade.toString()+"%"),
          FlatButton(
            child: Text("Edit")
          )
        ],
      )
    );
  }

}