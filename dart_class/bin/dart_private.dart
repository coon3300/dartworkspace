import 'package:dart_class/dart_private.dart';

main() {
  Person person = Person('Kim', 28, 29);
  print('name : ${person.name}');
  // print('age : ${person._age}'); // _age는 private이라 접근 불가
  print('_age : ${person.getAge()}');
  print('__age : ${person.get_Age()}');

  // print('_getMsg : ${person._getMsg()}'); // _getMsg()는 private이라 접근 불가
  person.showInfo();
}
