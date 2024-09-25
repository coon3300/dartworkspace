import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<String>.value(
      value: 'Shared Data', // 공유 데이터
      child: MaterialApp(
        title: 'Flutter Demo App',
        initialRoute: '/firstPage',
        routes: {
          '/firstPage': (context) => FirstPage(),
          '/secondPage': (context) => SecondPage(),
        },
      ),
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
    // 현재 Provider가 가지고 있는 데이터를 불러오는 코드
    result = Provider.of<String>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 버튼을 클릭할 경우 새로운 위젯을 호출
                  Navigator.pushNamed(context, '/secondPage');
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
  late String data;

  @override
  Widget build(BuildContext context) {
    data = Provider.of<String>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // 버튼을 클릭할 경우 현재 위젯을 제거
                    Navigator.pop(context);
                  },
                  child: Text('Go to previous Page'),
                ),
              ),
              Text('$data')
            ]));
  }
}
