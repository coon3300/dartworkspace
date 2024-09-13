// bin/dart_constructor_init.dart

import 'package:dart_class/dart_constructor_initList.dart';

void main() {
  Person first = Person();
  first.showInfo();

  Person second = Person.init("Han");
  second.showInfo();
}
