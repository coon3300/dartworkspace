void main() {
  // Map 타입 선언 및 초기화
  Map<int, String> testMap = {1: 'Red', 2: 'Orange', 3: 'Yellow', 4: 'Red'};

  // Map이 보유한 값의 실제 타입 : MapEntry 의 갯수 => Map.length
  print(testMap.length);
  // var keys = testMap.keys as List<int>; // 에러
  var keys = List<int>.from(testMap.keys);

  for (int i = 0; i < testMap.length; i++) {
    var currentKey = keys[i];
    print('$currentKey, ${testMap[currentKey]}');
  }

  for (var key in testMap.keys) {
    // Dart의 순환 for문
    print('$key, ${testMap[key]}');
  }

  // Map 타입 선언
  /// Set/Map은 {}
  var maps = <String, int>{};

  // Map 클래스 생성
  // var maps = Map();

  // 초기화
  maps['Red'] = 1;
  maps['Orange'] = 2;
  // maps['Yellow'] = 3;

  maps.forEach((key, value) {
    print('$key, $value');
  });

  maps['Yellow'] = 4;

  // 이미 해당 키가 등록된 경우 값을 업데이트,
  // 해당 키가 등록되지 않은 경우 추가

  maps.update('Blue', (value) => 20, ifAbsent: () => 0);

  // maps.forEach((key, value) {
  //   print('$key, $value');
  // });
  print(maps);
}
