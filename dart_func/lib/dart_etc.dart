// lib/dart_etc.dart
// 1) 익명함수
/*
  (var x, var y){
    return x + y;
  };
*/

var myAnyPlus = (var x, var y) {
  return x + y;
};

// 2) 람다식 : (var x, var y) => x + y; // return 생략.
var myLamPlus = (var x, var y) => x + y;

void etcMain() {
  var result = myAnyPlus(5, 10);
  print(result);
  result = myLamPlus(5, 10);
  print(result);
}
