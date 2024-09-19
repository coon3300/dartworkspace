void main() {
  // Set 타입 선언 및 초기화
  Set<String> colors = {'Red', 'Orange', 'Yellow', 'Red'};
  print(colors.length);
  colors.forEach(print);

  // Set 타입 선언
  var colorList = <String>{}; // Set/Map은 {}, list는 []

  // 초기화
  colorList.add('Skyblue');
  colorList.add('Green');
  colorList.addAll({'White', 'Black', 'Green'});

  colorList.forEach(print);
  print(colorList);
}
