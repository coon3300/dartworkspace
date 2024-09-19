import 'dart:async';

void main() {
  print('start');
  // 제너레이터 함수의 결과 Stream 객체 생성
  var stream = getData();
  // 해당 객체의 listen 등록
  stream.listen((x) => print('generator : $x'));
  // 기본적인 Stream 객체 선언 방식
  Stream.fromIterable([0, 1, 2, 3, 4])
      .listen((x) => print('fromIterable : $x'));
  print('do something');
}

// 제너레이터 함수 정의
Stream<int> getData() async* {
  // async*
  // 반복문의 결과 : 컬렉션을 기준으로 한 Stream 객체 생성
  for (int i = 0; i < 5; i++) {
    yield i; // return 대신 yield
  }
}
