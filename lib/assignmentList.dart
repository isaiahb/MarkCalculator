import 'package:flutter/material.dart';
import 'models/user.dart';


class AssignmentList extends StatefulWidget {
  final Course course;
  AssignmentList(this.course);

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
//      color: Colors.white,
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
      child: Card (
        child: Row(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Column (

              children:<Widget>[
                Text(
                    widget.gradable.name,
                    style: Theme.of(context).textTheme.headline

                )
              ],
            ),

            Column (
              children:<Widget>[
                Text(widget.gradable.grade.toString()+"%"),
              ],
            ),

            Spacer(),
            Column (
            mainAxisAlignment: MainAxisAlignment.end,
            children:<Widget>[
              IntrinsicHeight(
                  child: FlatButton(
                    child: Text("Edit"),
                    onPressed: (){print("pressed");},
                    color: Colors.purple,

                  ),
                )
              ],
            )

          ],
        ),
      )
    );
  }
  /*
  Text(widget.gradable.grade.toString()+"%"),
              FlatButton(child: Text("Edit"))


   */

}