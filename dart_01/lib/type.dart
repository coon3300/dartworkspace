// lib/type.dart

void printVariable() {
  num numVal = 10;
  int intVal = 100;
  double dubVal = 12.0;

  numVal = intVal;
  numVal = dubVal;

  // intVal = dubVal;
  // dubVal = intVal;
  intVal = dubVal.toInt();
  dubVal = intVal.toDouble();
}

void printCollection() {
  List<int> list = [1, 2, 1, 2, 3];
  print(list[0]);
  print(list[1]);

  Set<int> sets = {1, 1, 1, 3};
  print(sets.contains(1));

  Set<int> se1s = {1, 1, 1, 3};
  Map<String, dynamic> map = {'name': 'hong', 'age': 20};

  // print(map.name);
  print(map['name']);
  print(map['age']);
}

void printConstant() {
  var val = 10;
  final finalVal = 1 + val;
  // const constVal = 1 + val;
  const constVal = 1 + 10;
}
