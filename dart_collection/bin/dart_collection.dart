void main() {
  // List 타입 선언 및 초기화
  List<String> colors = ['Red', 'Orange', 'Yellow'];
  print(colors.first);
  print(colors.length);
  for (int i = 0; i < colors.length; i++) {
    print(colors[i]);
  }

  // List 타입 선언
  var colorList = <String>[]; // 리스트는 []
  print(colorList.isEmpty);
  // 초기화
  colorList.add('SkyBlue');
  colorList.add('Green');
  colorList.addAll(['White', 'Black']);
  // forEach
  colorList.forEach(print);
  colorList.forEach((value) {
    print(value);
  });

  // print(colorList);
}
