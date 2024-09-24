// lib/01_PagesTest.dart

import 'package:flutter/material.dart';

void main() => runApp(WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo App',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            // 버튼을 클릭할 경우 새로운 위젯을 호출
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => SecondPage()),
            );
          },
          child: Text('Go to next Page'),
        )));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            // 버튼을 클릭할 경우 새로운 위젯을 호출
            Navigator.pop(context);
          },
          child: Text('Go to previous Page'),
        )));
  }
}
