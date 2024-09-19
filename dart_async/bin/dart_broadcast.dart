// dart_broadcast.dart

import 'dart:async';

void main() {
  print('start');

  // StreamController.broadcast()를 통해 StreamController 객체 생성
  StreamController streamCtrl =
      StreamController.broadcast(); // boradcast() : 다중 이벤트 헨들러(?)

  // 멤버 변수로 등록된 stream 객체에 등록할 listen을 등록
  streamCtrl.stream.listen((x) => print('listen 1 : $x')); // ';' 없음.
  streamCtrl.stream.listen((x) {
    print('listen 2 : $x'); // ';' 있음.
  });

  // StreamController 객체의 add()를 통해 이벤트 등록
  streamCtrl.add(100);
  streamCtrl.add('test');
  streamCtrl.add(200);
  streamCtrl.add(300);
  streamCtrl.close();
  print('do something');
}
