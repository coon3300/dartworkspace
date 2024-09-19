// dart_stream.dart

void main() {
  print('start');

  // 단순한 형태
  dynamic stream = Stream.value(100).listen((x) => print('getData : $x'));

  // 특정 주기로 반복
  stream = Stream.periodic(const Duration(seconds: 1), (i) => i * i).take(5);
  // stream = Stream.periodic(const Duration(seconds: 1), (i) => i * i);

  // 작업 요청 : 객체 생성과 요청을 분리
  stream.listen((x) => print('print : $x'));

  // Future를 기준으로
  Stream.fromFuture(getData()).listen((x) => print('fromFuture : $x'));

  print('end');
}

Future<String> getData() async {
  return Future.delayed(
      Duration(seconds: 3), () => 'after 3 seconds'); //setTimeout()
}
