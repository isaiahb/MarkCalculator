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

  final renameController = TextEditingController(text: "");

  void _rename() {
    print(renameController.text);
  }

  void _showRenameDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Rename ${widget.gradable.name}"),
            content: Row(
              children: <Widget>[
                Text("New Name: "),
                Expanded(child: TextField(controller: renameController,)),
              ],
            ),

            actions: <Widget>[
              FlatButton(
                textTheme: Theme.of(context).buttonTheme.textTheme,
                color: Colors.black12,
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              new FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text("Confirm", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  _rename();
                  Navigator.of(context).pop();
                  setState(() {
                    widget.gradable.name = renameController.text;
                  });
                }
              ),

            ],
          );
        }
    );
  }

  void _deleteDialog(BuildContext context, Gradable gradable) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm Delete"),
            content: Text("Are you sure you want to delete ${gradable.name}"),

            actions: <Widget>[
              FlatButton(
                textTheme: Theme.of(context).buttonTheme.textTheme,
                color: Colors.black12,
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              new FlatButton(
                  color: Colors.red,
                  child: Text("Delete", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    widget.remove(widget.gradable);
                    Navigator.of(context).pop();
                  }
              )

            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.gradable.name, textScaleFactor: 1.5,),
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
                  onPressed: ()=> _deleteDialog(context, widget.gradable)
              )),

            ],
          ),
        )
      ],
    );
  }
}
