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
  bool editing = false;

  AssignmentWidget({this.gradable});

  @override
  _AssingmentState createState() => new _AssingmentState();

}

class _AssingmentState extends State<AssignmentWidget> {

  Widget _getEdit() {
    if (!widget.editing)
      return Container();

    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 0.0),

      child: Card(
        child:Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Mark",
                    style: Theme.of(context).textTheme.headline
                  )
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Weight",
                      style: Theme.of(context).textTheme.headline)
                ),
              ],
            ),
          ],
        )
      ),
    );
  }

  Widget _getCard() {
    return Card (
      child: Row(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
                widget.gradable.name,
                style: Theme.of(context).textTheme.headline

            ),
          ),
          Spacer(),

          Container(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(widget.gradable.grade.toString()+"%", style: Theme.of(context).textTheme.headline)
          ),

//            Spacer(),
          Column (
            mainAxisAlignment: MainAxisAlignment.end,
            children:<Widget>[
              IntrinsicHeight(
                child: FlatButton(
                  child: Text("Edit"),
                  onPressed: (){setState(() {
                    widget.editing = !widget.editing;
                  });},
                  color: Colors.purple,
                ),
              )
            ],
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.white,
      padding: EdgeInsets.only(bottom: 0.0, top: 0.0),
      child: Column(
        children: <Widget>[
          _getCard(),
          _getEdit()
        ],
      )
    );
  }
  /*
  Text(widget.gradable.grade.toString()+"%"),
              FlatButton(child: Text("Edit"))


   */

}