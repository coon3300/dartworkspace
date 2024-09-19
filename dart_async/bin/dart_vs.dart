// dart_vs.dart
import 'dart:io';

List<String> messages = ['Hello !!', 'Welcome ', 'to ', 'Flutter World!'];

void futureTest() {
  var future = Future(() {
    var result = '';
    for (int i = 0; i < 100000; i++) {
      // result += messages[i];
      return messages[i];
    }
    // return result;
  });

  future.then((x) {
    stdout.write(x);
  }, onError: (e) {
    stdout.write(e);
  });
}

void stream() {
  var stream = Stream.fromIterable(messages);

  stream.listen((x) => stdout.write(x));
}

void main() {
  stream();
}
