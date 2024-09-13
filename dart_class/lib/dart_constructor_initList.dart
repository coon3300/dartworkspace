// lib/dart_constructor_initList.dart

class Person {
  String? name;
  int? age;
  // 이름이 없는 생성자 + 초기화 리스트
  Person()
      : name = "Kim",
        age = 28 {
    print('default');
    print('name : $name, age : $age');
  }

  // 이름이 있는 생성자 + 초기화 리스트
  Person.init(String name) : age = 20 {
    print('named');
    print('name : ${this.name}, age : $age');
    this.name = name;
  }

  showInfo() {
    print('name : $name, age : $age');
  }
}
