import 'package:flutter/material.dart';
import 'models/user.dart';


class AssignmentList extends StatefulWidget {
  Course course = new Course(gradables: [new Gradable()]);
  AssignmentList({this.course});

  @override
  _AssignmentListState createState() => _AssignmentListState(course);
}

class _AssignmentListState extends State<AssignmentList> {
  Course course = new Course();
  _AssignmentListState(this.course) {
    print("Cunstructed");
  }

  @override
  Widget build(BuildContext context) {
    print("called build");
    course = course!= null ? course : new Course(gradables: [new Gradable()]);
    return Container(
      child: new ListView.builder
        (
          itemCount: course.gradables.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return new AssignmentWidget(gradable: course.gradables[index]);
          }
      ),
    );
  }
}

class AssignmentWidget extends StatefulWidget {
  Gradable gradable = new Gradable();
  AssignmentWidget({this.gradable});

  @override
  _AssingmentState createState() => new _AssingmentState(gradable);
}

class _AssingmentState extends State<AssignmentWidget> {
  _AssingmentState(this._gradable);
  Gradable _gradable;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Row(
        children: <Widget>[
          Text(_gradable.name),
          Text(_gradable.grade.toString()+"%"),
          FlatButton(
            child: Text("Edit")
          )
        ],
      )
    );
  }

}