// dart_future.dart

void main() {
  print('start');

  // Future 책체 생성 : Uncompleted
  Future<String> myFuture = Future(() {
    for (int i = 0; i < 10000000000; i++) {
      // 10,000,000,000
    }
    // 해당 작업이 정상적으로 완료되면 반환
    // return 'I got lots of Data!';
    return throw Exception('Failed : data is too many.');
  }); // 리턴 타입

  // Completed
  myFuture.then((data) {
    // 작업의 결과 => 매개 변수
    print(data);
  }, onError: (error) {
    // 작업 중 발생한 에러
    print('Result, $error');
  });

  print('end');
}
