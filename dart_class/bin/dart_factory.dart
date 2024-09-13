// bin/dart_factory.dart

class Person {
  Person.init() {
    print('Person.init() 실행');
  }
// 팩토리 생성자
  factory Person([String type = 'Person']) {
    switch (type) {
      case 'Student':
        return Student();
      case 'Employee':
        return Employee();
      default:
        return Person.init();
    }
  }
// 멤버 함수
  String getType() {
    return 'Person';
  }
}

class Student extends Person {
  Student() : super.init();
  @override
  String getType() {
    return 'Student';
  }
}

class Employee extends Person {
  Employee() : super.init();
  @override
  String getType() {
    return 'Employee';
  }
}

main() {
  var person = Person();
  var student = Person('Student');
  var employee = Person('Employee');
  print('person variable type : ${person.getType()}');
  print('student variable type : ${student.getType()}');
  print('employee variable type : ${employee.getType()}');

  print('person runtime type : ${person.runtimeType}');
  print('student runtime type : ${student.runtimeType}');
  print('employee runtime type : ${employee.runtimeType}');

  var person2 = Person();
  var student2 = Student();
  var employee2 = Employee();
  print('person variable type : ${person2.getType()}');
  print('student variable type : ${student2.getType()}');
  print('employee variable type : ${employee2.getType()}');
}
