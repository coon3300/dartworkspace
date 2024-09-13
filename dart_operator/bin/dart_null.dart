// bin/dart_null.dart

class Employee {
  // String name = 'Employee';
  String? name;
}

// 1) 조건적 멤버 접근 : ?.
void fieldMain() {
  // Employee? emp = null; // ?  : 변수가 null을 가질 수 있음
  Employee emp = Employee()..name = 'Employee'; // 캐스테이드 사용법

  // var reult = emp.name;
  var result = emp?.name; // ?. : 해당 객체가 null인 경우
  /*
  if (emp == null) {
    result = null;
  } else {
    result = emp.name;
  }
  */
  print(result);

  emp ??= Employee(); // ?? : 변수가 null 인경우
  result = emp.name;
  print(result);
}

// 2) null 확인 연산자 : ??
void nullCheckMain() {
  // Employee? emp = null;
  // var result = emp?.name ?? 'No employee';

  Employee emp = Employee();

  var result = emp.name ?? 'No employee';
  /*
  var result;
  if (emp.name == null) {
    result = 'No employee';
  } else {
    result = emp.name;
  }
  */

  print(result);
}

void main() {
  // fieldMain();
  nullCheckMain();
}
