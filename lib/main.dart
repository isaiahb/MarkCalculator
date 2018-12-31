import 'package:flutter/material.dart';
import 'assignmentList.dart';
import 'models/user.dart';
import 'appBar.dart';

void main() => runApp(new CourseWidget(Course(gradables: [new Gradable(name: "test2", grade: 87.0, weight: 0.2)])));

class CourseWidget extends StatefulWidget {
  Course course;
  CourseWidget(this.course);

  @override
  _CourseWidgetState createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  int _selectedIndex = 0;

  void _addGradable(){
    setState(() {
      widget.course.addGradeable("Test", 0.6, 45);
    });
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  void _removeGrade(Gradable gradable){
    setState(() {
      widget.course.removeGradeable(gradable);
    });
  }

  @override
  Widget build(BuildContext context) {
//    widget.course = widget.course != null ? widget.course : Course(gradables: [new Gradable(name: "test1")]);

    return MaterialApp(
      title: "Course",
      home: Scaffold(
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
          onPressed: _addGradable,
          elevation: 20,

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
        ),
    debugShowCheckedModeBanner: false,
    );

  }
}