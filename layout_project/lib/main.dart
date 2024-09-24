import 'package:flutter/material.dart';
import './screens/loginPage.dart';
import './screens/myInfoPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Project',
      home: LoginPage(),
      // home: MyInfoPage(),
    );
  }
}
