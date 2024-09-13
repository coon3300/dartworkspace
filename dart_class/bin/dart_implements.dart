// bin/dart_implements.dart

abstract class Person {
  eat();
  study() {
    print('People are studying.');
  }
}

abstract class Junior {
  work() {
    print('work hard');
  }
}

// 추상 클래스 Person와 Junior을 구현한 클래스
// 구현 가능. 오버라이딩 강제.
class Developer implements Person, Junior {
// Person
  @override
  eat() {
    print('Developer eat a meal');
  }

  @override
  study() {
    print('Developers are studying.');
  }

// Junior
  @override
  work() {
    print('Developers are developing.');
  }
}

main() {
// 타입을 Person으로 선언한 경우 Junior의 메서드 사용불가
  Person person = Developer();
  person.eat();
  person.study();

// 타입을 Junior으로 선언한 경우 Person의 메서드 사용불가
  Junior junior = Developer();
  junior.work();

// 타입을 Developer으로 선언한 경우 오버라이딩한 모든 메서드 사용가능
  Developer developer = Developer();
  developer.eat();
  developer.study();

  developer.work();
}
