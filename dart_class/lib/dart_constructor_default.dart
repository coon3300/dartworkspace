// lib/dart_constructor_default.dart

class Person {
  String? name;

  // Person() {} // 기본 생성자, 생성자를 생략 => 자동 생성.

  getName() {
    return this.name;
  }
}

class Student {
  String? school;
  int? grade;
  String? name;

  // 이름이 없는 생성자, 클래스명 사용. 1개만
  Student(String school, int grade, String name) {
    this.school = school;
    this.grade = grade;
    this.name = name;
  }
  // 생성자 오버로딩 X => 이름이 없는 생성자는 오직 하나

  // 이름이 있는 생성자
  Student.defaultInit() {
    print('이름이 있는 생성자 호출');
  }

  showInfo() {
    print('$school, $grade, $name');
  }
}
