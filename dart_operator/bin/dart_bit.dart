// bin/dart_bit.dart

void main() {
  int a = 5;
  int b = 3;

  // 5 : 0000 0101
  // 3 : 0000 0011

  print(a & b); // 0000 0001 : 1
  print(a | b); // 0000 0111 : 7
  print(a ^ b); // 0000 0110 : 6
  print(a >> b); // 0000 0000 : 0
  print(a << b); // 0010 1000 : 40
}
