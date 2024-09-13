// bin/dart_cascade.dart
class Employee {
  String name = "employee";
  int? age;

  setAge(int age) {
    this.age = age;
  }

  showInfo() {
    print('$name is $age');
  }
}

void defaultMain() {
  Employee emp = Employee();
  emp.name = "Hong";
  emp.setAge(25);
  emp.showInfo();
}

void cascadeMain() {
  Employee emp = Employee()
    ..name = "Kang"
    ..setAge(30)
    ..showInfo();
  print('check : ');
  emp.showInfo();
}

void main() {
  defaultMain();
  cascadeMain();
}
