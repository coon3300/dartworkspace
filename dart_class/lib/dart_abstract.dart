// lib/dart_abstract.dart

// 추상 클래스
// - 추상 메서드를 가질 수 있다.
// - 인스턴스를 생성할 수 없다.
abstract class Person {
  work(); // 추상 메서드 : 함수의 몸체가 없다.
// 필요에 따라 일반 메서드를 작성할 수 있다.
  study() {
    print('People are studying.');
  }
}

// 추상 클래스 Person을 상속한 클래스
class Developer extends Person {
// 추상 메서드만 오버라이딩 한다.

  @override
  work() {
    print('Developers are developing.');
  }
}

abstract class Junior {
  business();
}
