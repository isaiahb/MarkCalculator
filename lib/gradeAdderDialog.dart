import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'titledWidget.dart';

class GradeAdderDialog extends StatefulWidget {
  final Function gradeAdder;

  GradeAdderDialog({@required this.gradeAdder});
  
  @override
  GradeAdderDialogState createState() {
    return new GradeAdderDialogState();
  }
}

class GradeAdderDialogState extends State<GradeAdderDialog> {
  final nameController = TextEditingController(text: "Assignment");

  int _currentGradeValue = 50;

  int _currentWeightValue = 50;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Name Assignment"),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Assignment Name',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitledWidget(text: "Enter Grade", widget: NumberPicker.integer(
                  initialValue: _currentGradeValue,
                  minValue: 0,
                  maxValue: 100,
                  onChanged: (newValue) =>
                  setState(() => _currentGradeValue = newValue))
                ),

                TitledWidget(text: "Enter Weight", widget: NumberPicker.integer(
                  initialValue: _currentWeightValue,
                  minValue: 0,
                  maxValue: 100,
                  onChanged: (newValue) =>
                  setState(() => _currentWeightValue = newValue))
                ),
              ],
            )
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row (
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Spacer(),


                FlatButton(
                  textTheme: Theme.of(context).buttonTheme.textTheme,
                  color: Colors.black12,
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: FlatButton(
                      color: Theme.of(context).primaryColor,
                      child: Text("Add", style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        widget.gradeAdder(
                            name: nameController.text,
                            weight: (_currentWeightValue.toDouble())/100.0,
                            mark: _currentGradeValue.toDouble()
                        );
                        Navigator.of(context).pop();

                      }
                  ),
                ),
              ],
            ),
          )
        ],

    );
  }
}