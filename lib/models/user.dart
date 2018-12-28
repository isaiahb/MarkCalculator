class User {

}

class Year {
  List<Course> courses;
  String name;
}


//ECE 2205, Circuits 1
class Course {
  List<Gradable> gradables = new List<Gradable>();
  double credits;
  double weight;
  String code;
  String name;

  Course({this.credits = 0.5, this.weight = 0.0, this.code ="ECE000", this.name="Course 01", this.gradables});

  double getFinalGrade() {
    double grade;
    for (Gradable gradable in gradables) {
      grade += gradable.getFinalGrade();
    }
    return grade;
  }

  double getCurrentGrade(double currentMaxWeight) {
    double grade;

    for (Gradable gradable in gradables) {
      grade += gradable.getCurrentGrade(currentMaxWeight);
    }
    return grade;
  }

  double _getCurrentWeight() {
    double weight = 0.0;
    for (Gradable gradable in gradables) {
      if (gradable.marked)
        weight+= gradable.weight;
    }
    return weight;
  }

}

//Assingment, Lab, Midterm, Final
class Gradable {
  String name;
  double weight;
  double grade;
  bool marked;

  Gradable({this.name = "Assignment", this.weight = 0.0, this.grade = 0.0, this.marked = false});

  double getFinalGrade() {
    return grade*weight;
  }
  double getCurrentGrade(double currentMaxWeight) {
    double currentWeight = weight * (1.0/currentMaxWeight);
    return grade * currentMaxWeight;
  }
}