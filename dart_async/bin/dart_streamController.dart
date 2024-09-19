// dart_streamController.dart

import 'dart:async';

void main() {
  print('start');

  // StreamController 객체 생성, 멤버 변수로 Stream 객체를 포함.
  StreamController streamCtrl = StreamController(); // 단일 이벤트 헨들러(?)

  // 멤버 변수로 등록된 stream 객체에 등록할 listen을 등록, 기본적으로 1개만 등록가능
  streamCtrl.stream.listen((x) => print(x));

  // StreamController 객체의 add()를 통해 이벤트 등록
  streamCtrl.add(100);
  streamCtrl.add('test');
  streamCtrl.add(200);
  streamCtrl.add(300);
  streamCtrl.close();
  print('do something');
}
