class Person {
// 멤버 변수
  String? name;
// 생성자
  Person() {
    print('Person Objet Created');
  }
// 멤버 함수
  setName(String name) {
    this.name = name;
  }

  getName() {
    return this.name;
  }

  showInfo() {
    print('name is $name');
  }
}

class Student extends Person {
// 자식 클래스의 멤버 볌수
  int? studentId;
  Student() {
// 자식 클래스의 생성자를 호출하는 경우 부모의 생성자가 자동 호출
    print('Student Object Created');
  }
  @override // 부모의 메서드를 오버라이딩하는 경우로 필요에 따라 어노테이션은 생략가능
  showInfo() {
// 자식 클래스 내부에서 부모 클래스의 멤버에 접근할 때 super 키워드를 사용
    // super.showInfo();
    print('name is ${super.getName()} and ID is $studentId');
  }

// 자식 클래스의 멤버 함수
  getType() {
    return 'Student';
  }
}

main() {
// 자식 클래스로 객체 생성
  Student student = Student();
  student.studentId = 1024; // 자식 클래스의 멤버 변수
  student.setName('Kim'); // 부모 클래스의 멤버 함수
  student.showInfo(); // 자식 클래스가 오버라이딩한 멤버 함수
  print(student.getType()); // 자식 클래스의 고유 멤버 함수
}
