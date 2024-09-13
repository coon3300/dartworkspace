// lib/dart_constructor_redirect.dart

class Person {
  String? name;
  int? age;
  // 이름이 없는 생성자
  Person(this.name, this.age) {}

  // 리다이렉팅 생성자 => 이름이 없는 생성자 호출
  Person.init(String name) : this(name, 20);

  // 리다이렉팅 생성자 => 이름이 있는 생성자 호출
  Person.second(String name) : this.init(name);

  // 멤버 함수
  showInfo() {
    return '$name, $age';
  }
}
