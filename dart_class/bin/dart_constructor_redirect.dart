// bin/dart_constructor_redirect.dart
// import 'package:dart_class/dart_constructor_redirect.dart';
import '../lib/dart_constructor_redirect.dart';

void main() {
  Person person = Person.second('Kim');
  print(person.showInfo());
}
