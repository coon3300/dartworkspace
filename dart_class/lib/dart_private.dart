// lib/dart_private.dart

class Person {
// 멤버 변수
  String? name; // public
  int? _age; // private
  int? __age; // private

// 생성자
  // Person(this.name, this.__age);
  Person(this.name, this._age, this.__age);

// 멤버 함수
  // public
  getAge() {
    return this._age;
  }

  // public
  get_Age() {
    return this.__age;
  }

  // private
  _getMsg() {
    return 'Hello !';
  }

  // public
  showInfo() {
    print('${_getMsg()}, My name is $name and _age is $_age');
  }
}
