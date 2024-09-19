import 'dart:isolate';

late int count = 100;
// 기본 isolate
void main() {
  count = 0;
  // isolate 추가
  // Isolate.spawn(entryPoint, message);
  Isolate.spawn(isolateTest, 1);
  Isolate.spawn(isolateTest, 2);
  Isolate.spawn(isolateTest, 3);
  Isolate.spawn(isolateTest, 'a');
  Isolate.spawn(isolateTest, 'b');
  Isolate.spawn(isolateTest, 'c');
}

isolateTest(var m) {
  count++;
  print('isolate no.$m, $count');
}
