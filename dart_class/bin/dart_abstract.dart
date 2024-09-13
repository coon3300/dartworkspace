import 'package:dart_class/dart_abstract.dart';

main() {
  // Person developer = Person(); // 추상 클래스 생성자 사용 X
  Person developer = Developer();
  developer.work(); // 오버라이딩
  developer.study(); // Person 클래스, 일반 메소드

  // Person person = developer as Person;
  Person person = developer;
  person.work();
  person.study();
}
