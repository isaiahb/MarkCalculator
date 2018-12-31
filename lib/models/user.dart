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
    double grade = 0;
    for (Gradable gradable in gradables) {
      grade += gradable.getFinalGrade();
    }
    grade = (grade*10).truncateToDouble();
    grade /= 10;
    return grade;
  }

  double getCurrentGrade() {
    double grade = 0;
    double currentMaxWeight = _getCurrentWeight();
    for (Gradable gradable in gradables) {
      grade += gradable.getCurrentGrade(currentMaxWeight);
    }
    grade = (grade*10).truncateToDouble();
    grade /= 10;
    return grade;
  }

  double _getCurrentWeight() {
    double weight = 0.0;
    for (Gradable gradable in gradables) {
        weight+= gradable.weight;
    }
    return weight;
  }

  void addGradeable([String name = "Test", double weight = 0.0, double grade = 0.0, bool marked = false]){
    double remianingWeight = _getRemainingWeight();
    print(remianingWeight);
    if(remianingWeight == 0) return;
    if(weight > _getRemainingWeight()) weight = remianingWeight;
    gradables.add(new Gradable(
      name: name,
      weight: weight,
      grade: grade,
      marked: marked
    ));
  }

  Gradable removeGradeable(Gradable gradable){
    if(!gradables.contains(gradable)) return null;

    Gradable removed = gradable;
    gradables.remove(gradable);
    return removed;
  }

  double _getRemainingWeight(){
    return 1.0 - _getCurrentWeight();
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
    if(grade == null) print("grade");
    if(weight == null) print("weight");
    return grade*weight;
  }
  double getCurrentGrade(double currentMaxWeight) {
    double currentWeight = weight * (1.0/currentMaxWeight);
    return grade * currentWeight;
  }
}