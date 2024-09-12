// 일급객체
// 1) 변수가 함수를 참조 할 수 있다

void welcomeMsg() {
  print('Hello, Dart!!!');
}

void firstMain() {
  var myFun = welcomeMsg;
  Function myFun1 = welcomeMsg;
  void Function() myFun2 = welcomeMsg;

  welcomeMsg();
  myFun();
  myFun1();
  myFun2();
}

// 2) 다른 함수의 인자로 함수를 전달
void forEach(var callback) {
  var list = [1, 2, 3, 4, 5];

  for (int i = 0; i < list.length; i++) {
    callback(list[i], list);
    // plus(i, list);
  }
}

void plus(int num, var list) {
  int result = num + 100;
  print(result);
  print('list : $list');
}

void secondMain() {
  forEach(plus);
}

// 3) 함수를 함수의 반환 값으로 사용
makeAddFunc(int init) {
  String msg = 'result';
  // 익명함수
  // add(x)
  return (x) {
    // x : 5, 20
    // 'result : (변수 init와 x를 더한 결과값)';
    return '$msg : ${init + x}'; // init : 10
  };
}

void thirdMain() {
  int initValue = 10;

  var add = makeAddFunc(initValue);
  // add : 하나의 함수로 매개변수로 넘어오는 모든 값에 10을 더하는 함수
  /*
    add(x) {
      // 'result : (변수 init와 x를 더한 결과값)';
      return '$msg : ${init + x}';
    };
  */
  // 함수호출

  print('$initValue + 5 : ${add(5)}');
  print('$initValue + 20 : ${add(20)}');
}
