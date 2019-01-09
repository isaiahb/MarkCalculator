import 'package:flutter/material.dart';
import 'assignmentList.dart';
import '../models/user.dart';
import 'courseAppBar.dart';
import 'gradeAdderDialog.dart';


class CourseWidget extends StatefulWidget {
  final Course course;
  CourseWidget(this.course);

  @override
  _CourseWidgetState createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  int _selectedIndex = 0;

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
          return new GradeAdderDialog(gradeAdder: _addGradable);
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.course.name),
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
                title: Text('Marks')
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