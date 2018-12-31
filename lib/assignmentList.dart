import 'package:flutter/material.dart';
import 'models/user.dart';


class AssignmentList extends StatefulWidget {
  final Course course;
  final Function removeGrade;
  AssignmentList(this.course, this.removeGrade);

  @override
  _AssignmentListState createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: widget.course.gradables.length,
          itemBuilder: (BuildContext context, int index) {
            return new AssignmentWidget(gradable: widget.course.gradables[index], remove: widget.removeGrade);
          }
      ),
    );
  }
}

class AssignmentWidget extends StatefulWidget {
  final Gradable gradable;
  final Function remove;
  AssignmentWidget({this.gradable, this.remove});
  @override
  _AssignmentWidgetState createState() => new _AssignmentWidgetState();
}


class _AssignmentWidgetState extends State<AssignmentWidget> {

  void _onEditPressed() => print("editting");

  void _onDeletePressed() => print("deleting");

  Widget _getTrailing() {
    return Container(
      child: Row(children: <Widget>[
        RaisedButton(child: Text("Edit"),
            color: Colors.green,
            onPressed: _onEditPressed),
        RaisedButton(child: Text("Delete"),
            color: Colors.red,
            onPressed: _onDeletePressed),

      ]),
    );
  }

  void _resetDate() {}

  void _delete() {}
  final renameController = TextEditingController(text: "");

  void _rename() {
    print(renameController.text);
  }

  void _showRenameDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Rename - text"),
            content: TextField(
              controller: renameController,
            ),

            actions: <Widget>[
              new FlatButton(
                  child: Text("Confirm", style: TextStyle(color: Colors.green)),
                  onPressed: () {
                    _rename();
                  }
              ),

              FlatButton(
                color: Colors.red,
                child: Text("Cancel", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  print("cancel");
                },
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return ExpansionTile(
      title: Text("Assignment", textScaleFactor: 1.5,),
      leading: Text("weight " + (widget.gradable.weight * 100).truncateToDouble().toString() + "%"),
      trailing: Text(widget.gradable.grade.truncateToDouble().toString() + " % ", style: Theme.of(context).textTheme.display1),

      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(flex:4, child: RaisedButton(
                  child:Text("Rename", style:TextStyle(color:Colors.white)),
                  color: Colors.green,
                  onPressed: ()=> _showRenameDialog(context)
              )),

              Spacer(),
              Expanded(flex:4, child: RaisedButton(
                  child:Text("Delete", style:TextStyle(color:Colors.white)),
                  color: Colors.red,
                  onPressed: _onDeletePressed)
              ),

            ],
          ),
        )
      ],
    //      leading: RaisedButton(child:Text("Edit"), onPressed: _onEditPressed),
    //      trailing: RaisedButton(child:Text("Delete"), onPressed: _onDeletePressed)
=======
    return Dismissible(

        key: Key(widget.gradable.name + "#" +
            widget.gradable.grade.truncate().toString()),

        background: Container(color: Colors.red),

        onDismissed: (direction) {
          widget.remove(widget.gradable);
        },

        child: ExpansionTile(
          title: Text("Assignment", textScaleFactor: 1.5,),
          leading: Text("weight " +
              (widget.gradable.weight * 100).truncateToDouble().toString() +
              "%"),
          trailing: Text(
              widget.gradable.grade.truncateToDouble().toString() + " % ",
              style: Theme
                  .of(context)
                  .textTheme
                  .display1),

          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(flex: 4, child: RaisedButton(
                      child: Text(
                          "Rename", style: TextStyle(color: Colors.white)),
                      color: Colors.green,
                      onPressed: () => _showRenameDialog(context)
                  )),

                  Spacer(),
                  Expanded(flex: 4, child: RaisedButton(
                      child: Text(
                          "Delete", style: TextStyle(color: Colors.white)),
                      color: Colors.red,
                      onPressed: _onDeletePressed)
                  ),

                ],
              ),

            )
          ],
        )
>>>>>>> f945f95a16ac065a50d9ac5f0597dcb3363d4a5b
    );
  }
}

