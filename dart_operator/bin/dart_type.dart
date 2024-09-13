// bin/dart_type.dart

import 'dart:io';

class Person {
  // 필드
  String name = 'Person';

  // 생성자

  // 메소드
}

class Employee extends Person {
  String name = 'Employee';
}

class Student extends Person {
  String name = 'Student';
}

void main() {
  // Employee emp = new Employee();
  Employee emp = Employee(); // new 연산자 생략 가능.
  Student std = Student();

  Person first = Person();
  print('first.name = ${first.name}'); // Employee

  // 타입변환
  // Person first = emp as Person;
  first = emp as Person;

  // Person second = std as Person;
  Person second = std; // as Person 생략 가능.

  print('emp.name = ${emp.name}'); // Employee
  print('first.name = ${first.name}'); // Employee
  print('std.name = ${std.name}'); // Student
  print('second.name = ${second.name}'); // Student

  // 맞는 지, 타입검사 : is
  if (emp is Employee) {
    print('emp is Employee.');
  } else {
    print('emp is not Employee.');
  }
  // 아닌 지, 타입검시 : is!
  if (emp is! Employee) {
    print('emp is not Employee.');
  } else {
    print('emp is Employee.');
  }

  if (std is Person) {
    print('std is Person.');
  } else {
    print('std is not Person.');
  }
  if (std is Student) {
    print('std is Student.');
  } else {
    print('std is not Student.');
  }

  emp = first as Employee;
  print('emp.name = ${emp.name}'); // Employee
}
