// bin/dart_const.dart
class Person {
  // 멤버 변수 => 모두 final 키워드를 붙임
  final String name;
  final int age;

  // int? age;
  // const Person(this.name,);

  // 상수 생성자
  const Person(this.name, this.age);

  // 멤버 함수
  showInfo() {
    return '$name , $age';
  }
}

void main() {
  Person personOne = const Person('Kim', 25); // 새로운 객체 생성
  Person personTwo = const Person('Kim', 25); // 동일한 객체 참조
  Person personThree = new Person('Kim', 25); // 새로운 객체 생성
  Person personFour = new Person('Kim', 25); // 새로운 객체 생성
// 각 객체의 멤버 변수 값을 출력
  print('one : ${personOne.showInfo()}');
  print('two : ${personTwo.showInfo()}');
  print('three : ${personThree.showInfo()}');
  print('four : ${personFour.showInfo()}');
// 각 객체가 실제로 동일한 객체인지 확인
  print(identical(personOne, personTwo));
  print(identical(personTwo, personThree));
  print(identical(personThree, personFour));
}
