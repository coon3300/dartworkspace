import 'package:display_widget/widgets/01_data_display.dart';
import 'package:flutter/material.dart';
import './widgets/01_data_display.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // StatelessWidget : 변경사항 저장하지 않는 위젯, 출력되는게 전부

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Display Demo', // 앱의 기본 이름
      theme: ThemeData(
          // 테마 : 전체적으로 통일해서 속성 넣을 부분(전반적인 색 지정)
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true),
      home: MyHomePage(), // 무엇을 출력할건지
    );
  }
}

// 출력할 부분
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App Name'),
        ),
        body: _getCurrentPage(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            // on으로 시작되는 모든 속성 이벤트라고 생각하면 됨.
            setState(() {
              _curIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              // BottomNavigationBarItem : 메뉴설정
              icon: Icon(Icons.home,
                  size: 30, color: _curIndex == 0 ? Colors.blue : Colors.black),
              label: "home",
            ),
            BottomNavigationBarItem(
              // BottomNavigationBarItem : 메뉴설정
              icon: Icon(Icons.article,
                  size: 30, color: _curIndex == 1 ? Colors.blue : Colors.black),
              label: "datas",
            )
          ],
        ));
  }

  // body가 실행할 대상
  Widget _getCurrentPage() {
    late Widget page;
    switch (_curIndex) {
      case 0:
        page = homePage();
        break;
      case 1:
        page = dataDisplayPage();
        break;
    }
    return page;
  }
}

Container homePage() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      'Home Page',
      style: TextStyle(color: Colors.amber, fontSize: 30),
    ),
  );
}
