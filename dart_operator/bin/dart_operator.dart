import 'package:dart_operator/dart_operator.dart' as dart_operator;

void main(List<String> arguments) {
  int num = 5;
  dynamic result = num / 2;
  print('/2 , $result');
  result = num % 2;
  print('%2 , $result');
  result = num ~/ 2;
  print('~/2 , $result');

  num ~/= 2; //num = num ~/ 2;
  print('$num');

  print('========================');
  // ??= : ??(if null) + =

  String? msg = null;
  print(msg);
  msg ??= 'Hello, Dart!';
  print(msg);
  msg ??= 'Today is ...';
  print(msg);
}
