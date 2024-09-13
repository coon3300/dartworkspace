// bin/dart_getter_setter.dart

import 'package:dart_class/dart_getter_setter.dart';

void main() {
  Person person = Person('Kim');
  print(person.name); // getter를 필드 처럼 사용.

  // person.name('Hong');
  person.name = 'Hong'; // setter를 필드 처럼 사용.
  print(person.name);
}
