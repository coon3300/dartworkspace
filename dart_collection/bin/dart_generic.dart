// bin/dart_generic.dart

class Person {
  eat() {
    print("Person eat");
  }
}

class Student extends Person {
  @override
  eat() {
    print("Student eat");
  }
}

// 매개변수화 타입을 클래스 Person과 해당 클래스를 상속한 자식 클래스로 제한
class Manager<T extends Person> {
  eat() {
    print("Manager eat");
  }

  void showInfo() {
    print('Instance of $T');
  }
}

class Dog {
  eat() {
    print("Dog eat");
  }
}

void main() {
  var manager1 = Manager<Person>();
  manager1.showInfo();
  var manager2 = Manager<Student>();
  manager2.showInfo();
// 제네릭 타입을 명시하지 않는 경우 Person 객체를 포함하며
// extends를 사용해서 매개변수화 타입을 제한하지 않는 경우 dynamic 객체를 포함
  var manager3 = Manager();
  manager3.showInfo();
  // var manager4 = Manager<Dog>(); // 에러 발생
}
