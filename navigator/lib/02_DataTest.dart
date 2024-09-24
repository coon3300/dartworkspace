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

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // // 1. then을 사용하는 경우
                  // Navigator.push(
                  //         context, // 현재 위젯의 위치
                  //         MaterialPageRoute(
                  //             builder: (ctx) =>
                  //                 SecondPage(data: '(request)')))
                  //     .then((data) {
                  //   setState(() {
                  //     result = data;
                  //   });
                  // });

                  // 2. 버튼을 클릭할 경우 새로운 위젯을 호출 : routes에 등록된 이름
                  var data = await Navigator.push(
                      context, // 현재 위젯의 위치
                      MaterialPageRoute(
                          builder: (ctx) => SecondPage(data: '(request)')));
                  setState(() => result = data);

                  // //  3.버튼을 클릭할 경우 새로운 위젯을 호출 : WidgetDemo routes에 등록된 이름
                  // var data = await Navigator.pushNamed(context, '/page2');
                  // // 상태 변경 알림
                  // setState(() => result = data);
                },
                child: Text('Go to next Page'),
              ),
            ),
            Text('$result')
          ],
        ));
  }
}

class SecondPage extends StatelessWidget {
  final String data;
  SecondPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ElevatedButton(
                  // 버튼을 클릭할 경우 현재 위젯을 제거
                  onPressed: () => Navigator.pop(context, '(result)'),
                  child: Text('Go to previous Page'),
                ),
              ),
              Text('$data')
            ]));
  }
}
