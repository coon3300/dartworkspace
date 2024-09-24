// lib/01_PagesTest.dart -> 01_provider.dart로 전환
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // provider가 MaterialApp 생성 시 wraping(?).
    // 공유저장소(?).

    // 타입 생략 시 dynamic
    return Provider<String>.value(
      value: 'Shared Data', // 공유 데이터
      child: MaterialApp(
          title: 'Flutter Demo App',
          // home: FirstPage(),
          initialRoute: '/firstPage',
          // Navigator를 활용해서 전달할 화면 등록
          routes: {
            '/firstPage': (context) => FirstPage(),
            // '/secondPage': (context) => SecondPage(data: '(request)'),
            '/secondPage': (context) => SecondPage(),
          }),
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
    // Provider 사용 시 추가.
    // 현재 Provider가 가지고 있는 데이터를 불러오는 코드.
    // context 정보가 있어야함. initState()는 안됨.

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
                // Provider 미사용
                // onPressed: () async {
                //   // // 1. then을 사용하는 경우
                //   // Navigator.push(
                //   //         context, // 현재 위젯의 위치
                //   //         MaterialPageRoute(
                //   //             builder: (ctx) =>
                //   //                 SecondPage(data: '(request)')))
                //   //     .then((data) {
                //   //   setState(() {
                //   //     result = data;
                //   //   });
                //   // });

                //   // // 2. 버튼을 클릭할 경우 새로운 위젯을 호출 : routes에 등록된 이름
                //   // var data = await Navigator.push(
                //   //     context, // 현재 위젯의 위치
                //   //     MaterialPageRoute(
                //   //         builder: (ctx) => SecondPage(data: '(request)')));
                //   // setState(() => result = data);

                //   // //  3.버튼을 클릭할 경우 새로운 위젯을 호출 : WidgetDemo routes에 등록된 이름
                //   // var data = await Navigator.pushNamed(context, '/secondPage');
                //   // setState(() => result = data);

                // },

                // // 4. Provider 사용 시
                onPressed: () async {
                  var data = await Navigator.pushNamed(context, '/secondPage');

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
  // 프로바이더 사용
  // final String data;
  // SecondPage({required this.data});

  late String data;

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

                  // 프로바이더 사용
                  // onPressed: () => Navigator.pop(context, '(result)'),
                  onPressed: () => Navigator.pop(context),
                  child: Text('Go to previous Page'),
                ),
              ),
              Text('$data')
            ]));
  }
}
