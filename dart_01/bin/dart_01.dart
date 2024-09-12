// 패키지 내의 라이브러리를 사용.
import 'package:dart_01/dart_01.dart' as dartEx01; // lib
import 'package:dart_01/type.dart' as typeEx01; // lib

add(int a, int b) {
  return a + b;
}

void main() {
  var numberA = 10;
  var nubmerB = 20;
  var result = add(numberA, nubmerB);
  dartEx01.printResult(result);
  typeEx01.printCollection();
}
