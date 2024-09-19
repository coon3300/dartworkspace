// dart_multi_future.dart

Future<String> getData(var no) {
  return new Future(() {
    for (int i = 0; i < 100000000; i++) {
      // 10,000,000,000
    }
    return '$no completed';
  });
}

void futureMain() {
  print('start');

  var first = getData(1);
  first.then((data) {
    print(data);

    var second = getData(2);
    second.then((data) {
      print(data);

      var third = getData(3);
      third.then((data) {
        print(data);
      });
    });
  }).catchError(print);

  print('end');
}

// async
void futureTest(var no) async {
  print('$no start');

  var first = await getData(1);
  print('$no first result : $first');

  var second = await getData(2);
  print('$no second result : $second');

  var third = await getData(3);
  print('$no third result : $third');

  print('$no do something.');
}

void main() {
  futureTest(1);
  futureTest(5);
}
