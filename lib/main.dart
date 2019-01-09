import 'package:flutter/material.dart';
import 'assignmentList.dart';
import 'models/user.dart';
import 'appBar.dart';
import 'package:numberpicker/numberpicker.dart';
import 'titledWidget.dart';

void main() {
  Course course = Course();
  runApp(MarkCalculator(course));
}

class MarkCalculator extends StatelessWidget {
  final Course course;
  MarkCalculator(this.course);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Course",
      home: CourseWidget(course),
      debugShowCheckedModeBanner: false,
    );
  }

}

class CourseWidget extends StatefulWidget {
  final Course course;
  CourseWidget(this.course);

  @override
  _CourseWidgetState createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  final nameController = TextEditingController(text: "Assignment");
  int _selectedIndex = 0;

  int _currentGradeValue = 50;
  int _currentWeightValue = 50;

  void _addGradable({String name = "Assignment", double weight = 0.1, double mark = 80}){
    setState(() {
      widget.course.addGradable(name, weight, mark);
    });
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  void _removeGrade(Gradable gradable){
    setState(() {
      widget.course.removeGradable(gradable);
    });
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
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
                              _addGradable(
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
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Course"),
          leading: BackButton(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CourseMark(text: "Grade Avg", grade: widget.course.getFinalGrade().toString() + " %"),
                    CourseMark(text: "Culm Avg", grade: widget.course.getCurrentGrade().toString()  + " %"),
                  ],
                ),
              )
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
//          onPressed: ()=>  _addGradable(),//_showAddDialog(context),
          onPressed: ()=>  _showAddDialog(context),
          elevation: 5,
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('Courses')
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.show_chart),
                title: Text('Stats')
            ),

          ],
          currentIndex: _selectedIndex,
          onTap: _onTap,
        ),

        body: AssignmentList(widget.course, _removeGrade)
      );
  }

}