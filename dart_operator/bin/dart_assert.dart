// bin/dart_assert.dart

void main() {
  int a = 10;
  int b = 20;

// 일반 조건문
  if (a < b) {
    print('$a < $b');
  } else {
    print('$a > $b');
  }

  // 에러 확인
  assert(a > b);

  print('종료');
}
