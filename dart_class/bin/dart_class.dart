// 클래스 정의
class Person {
  // 변수 => 필드
  String? name; // public 생략
  // 생성자 => 생략 시 기본생성자 사용
  // 함수 => 메소드
  String getName() {
    return this.name ?? 'No Person';
  }
}

void main() {
  // 인스턴스(객체) 생성
  Person student = new Person();
  var teacher = Person(); // new 생략

  // 객체 필드 접근
  student.name = 'Kim';
  teacher.name = 'Park';

  // 객체 매소드 호출
  print('student name : ${student.getName()}');
  print('teacher name : ${teacher.getName()}');
}
