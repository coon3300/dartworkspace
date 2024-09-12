// lib/dart_parameter.dart
// 선택적 매개변수
// 1) 이름이 있는 매개변수(Named parameters) : {}

void getAddress(String country,
    {String city = '서울특별시', required String gu, String? ro}) {
  String address = '$country, $city, $gu, $ro';
  print(address);
}

void nameParams() {
  getAddress('대한민국', city: '대구광역시', gu: '중구', ro: '중앙대로');
  getAddress('대한민국', ro: '중앙대로', city: '대구광역시', gu: '중구');
  getAddress('대한민국', gu: '종로구');
}

// 2)위치적 선택 매개변수(Optional positional parameters) : []
// required 안됨.
void getAddr(String country, [String city = '서울특별시', String? gu]) {
  print('$country, $city, $gu');
}
