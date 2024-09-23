// 08_BottomNavigationBar.dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //화면에 위젯을 렌더링하는 함수
    return MaterialApp(title: 'Flutter Demo App', home: MyHomePage());
  }
}

// 여기까지는 공통코드

// 여기서부터 적용되는 위젯에 따라 수정
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 현재 선택한 페이지
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
      ),
      body: getPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black12,
        onTap: (index) {
          // 사용자가 선택한 메뉴에 대한 정보
          setState(() {
            _curIndex = index;
          }); // => build()함수
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  size: 30,
                  color: _curIndex == 0 ? Colors.blue : Colors.black54),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.search,
                  size: 30,
                  color: _curIndex == 1 ? Colors.blue : Colors.black54),
              label: 'Search'),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.settings,
                  size: 30,
                  color: _curIndex == 2 ? Colors.blue : Colors.black54),
              label: 'Setting')
        ],
      ),
    );
  }

  Widget getPage() {
    late Widget page;
    switch (_curIndex) {
      case 0:
        page = firstPage();
        break;
      case 1:
        page = secondPage();
        break;
      case 2:
        page = thirdPage();
        break;
    }
    return page;
  }
}

ListView firstPage() {
  return ListView(
    children: [
      ListTile(
          title: const Text('ListView'),
          subtitle: const Text('Using ListTile'),
          trailing: const Icon(Icons.more_vert),
          onTap: () {
            print('First');
          }),
      ListTile(
        leading: const FlutterLogo(size: 50.0),
        title: const Text('Flutter'),
        trailing: const Icon(Icons.autorenew),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(Icons.account_box, size: 50.0),
        title: const Text('Contacts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'),
      ),
      ListTile(
          title: const Text('ListView'),
          subtitle: const Text('Using ListTile'),
          trailing: const Icon(Icons.more_vert),
          onTap: () {
            print('First');
          }),
      ListTile(
        leading: const FlutterLogo(size: 50.0),
        title: const Text('Flutter'),
        trailing: const Icon(Icons.autorenew),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(Icons.account_box, size: 50.0),
        title: const Text('Contacts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'),
      ),
      ListTile(
          title: const Text('ListView'),
          subtitle: const Text('Using ListTile'),
          trailing: const Icon(Icons.more_vert),
          onTap: () {
            print('First');
          }),
      ListTile(
        leading: const FlutterLogo(size: 50.0),
        title: const Text('Flutter'),
        trailing: const Icon(Icons.autorenew),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(Icons.account_box, size: 50.0),
        title: const Text('Contacts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'),
      ),
      ListTile(
          title: const Text('ListView'),
          subtitle: const Text('Using ListTile'),
          trailing: const Icon(Icons.more_vert),
          onTap: () {
            print('First');
          }),
      ListTile(
        leading: const FlutterLogo(size: 50.0),
        title: const Text('Flutter'),
        trailing: const Icon(Icons.autorenew),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(Icons.account_box, size: 50.0),
        title: const Text('Contacts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'),
      ),
      ListTile(
          title: const Text('ListView'),
          subtitle: const Text('Using ListTile'),
          trailing: const Icon(Icons.more_vert),
          onTap: () {
            print('First');
          }),
      ListTile(
        leading: const FlutterLogo(size: 50.0),
        title: const Text('Flutter'),
        trailing: const Icon(Icons.autorenew),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(Icons.account_box, size: 50.0),
        title: const Text('Contacts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'),
      ),
    ],
  );
}

GridView secondPage() {
  return GridView.count(
    padding: const EdgeInsets.all(8),
    crossAxisCount: 3, // 한 행에 배치할 위젯 수
    crossAxisSpacing: 10, // 가로로 위젯 간격
    mainAxisSpacing: 50, // 세로로 위젯 간격
    children: [
      Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue[100],
          alignment: Alignment.center,
          child: const Text('1')),
      Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue[200],
          alignment: Alignment.center,
          child: const Text('2')),
      Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue[300],
          alignment: Alignment.center,
          child: const Text('3')),
      Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue[400],
          alignment: Alignment.center,
          child: const Text('4')),
      Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue[500],
          alignment: Alignment.center,
          child: const Text('5')),
      Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue[600],
          alignment: Alignment.center,
          child: const Text('6')),
      Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue[700],
          alignment: Alignment.center,
          child: const Text('7')),
      Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue[800],
          alignment: Alignment.center,
          child: const Text('8')),
    ],
  );
}

Container thirdPage() {
  return Container(
    alignment: Alignment.center,
    child: const Text(
      'Settings',
      style: TextStyle(color: Colors.blue, fontSize: 30),
    ),
  );
}
