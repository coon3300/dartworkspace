// lib/dart_getter_setter.dart

class Person {
  String _name; // private

  Person(this._name);
  /*
  Person(String name) {
    this._name = name;
  }
  */

/*
 String get name {
    // 매개변수를 받을 수 없음. getter에 () 없음.
    return this._name;
  }

  set name(String name) {
    this._name = name;
  }
*/

  String get name => _name;

  set name(String name) => _name = name;
}
