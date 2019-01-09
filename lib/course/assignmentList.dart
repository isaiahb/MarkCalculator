import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


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
    return Slidable(
      delegate: SlidableScrollDelegate(),
      child: ListTile(
        title: Text(widget.gradable.name, textScaleFactor: 1.5,),
        leading: Column(
          children: <Widget>[
            Icon(
              Icons.show_chart,
              color: Color.lerp(Colors.red, Colors.green, widget.gradable.weight),
              size: 40,
            ),
            Text((100*widget.gradable.getWeight()).toString() + " %")
          ],
        ),
        trailing: Text(widget.gradable.grade.truncateToDouble().toString() + " % ", style: Theme.of(context).textTheme.display1),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.blue,
          icon: Icons.edit,
          onTap: ()=> _showRenameDialog(context)
        ),

        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: ()=> _deleteDialog(context, widget.gradable)
        ),

      ],
    );
  }
}
