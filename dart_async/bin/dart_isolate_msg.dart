import 'dart:isolate';

void main() {
  int counter = 0;

  // isolate 간 메세지를 주고받기 위해 ReceiveProt 객체 생성
  ReceivePort mainReceivePort = new ReceivePort();

  // main isolate의 ReceiveProt 객체에 메세지가 전달된 경우 처리
  mainReceivePort.listen((fooSendPort) {
    // SendPort : ReceivePort 객체에 메세지를 보내기 위한 클래스
    if (fooSendPort is SendPort) {
      // #2
      // 해당 SendPort 객체를 생성한 ReceivePort에 메세지를 보냄
      fooSendPort.send(counter++);
    } else {
      // #4
      print(fooSendPort);
    }
  });

  for (int i = 0; i < 5; i++) {
    // 새로운 isolate 생성
    Isolate.spawn(foo, mainReceivePort.sendPort);
  }
}

foo(SendPort mainSendPort) {
  // 새로운 isolate 마다 개별 ReceivePort 객체 생성
  ReceivePort fooReceivePort = new ReceivePort();

  // #1
  // main isolate의 ReceivePort 객체에
  // 새로운 isolate의 ReceivePort 객체의 SendPort 객체 전달
  mainSendPort.send(fooReceivePort.sendPort);

  // #3
  // 새로운 isolate의 ReceiveProt 객체에 메세지가 전달된 경우 처리
  fooReceivePort.listen((msg) {
    mainSendPort.send('receive: $msg');
  });
}
