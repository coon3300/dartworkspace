// 07_pageView.dart

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 화면에 위젯을 렌더링하는 함수
    return MaterialApp(title: 'Flutter Demo App', home: MyHomePage());
  }
}

// 여기까지는 공통코드

// 여기서부터 적용되는 위젯에 따라 수정

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(
    initialPage: 1, // 시작페이지 index
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('App Name')),
        body: PageView(
          controller: _pageController,
          children: [
            firstPage(), // ListView
            secondPage(), // GridView
          ],
        ));
  }
}

ListView firstPage() {
  return ListView(
    children: [
      ListTile(
        title: Text('ListView'),
        subtitle: Text('Using ListView'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // 이벤트 헨들러
          print('First');
        },
      ),
      ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Flutter'),
        trailing: Icon(
          Icons.autorenew,
          // size: 50.0,
        ),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Contracts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'), // const 사용 불가.
      ),
      ListTile(
        title: Text('ListView'),
        subtitle: Text('Using ListView'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // 이벤트 헨들러
          print('First');
        },
      ),
      ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Flutter'),
        trailing: Icon(
          Icons.autorenew,
          // size: 50.0,
        ),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Contracts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'), // const 사용 불가.
      ),
      ListTile(
        title: Text('ListView'),
        subtitle: Text('Using ListView'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // 이벤트 헨들러
          print('First');
        },
      ),
      ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Flutter'),
        trailing: Icon(
          Icons.autorenew,
          // size: 50.0,
        ),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Contracts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'), // const 사용 불가.
      ),
      ListTile(
        title: Text('ListView'),
        subtitle: Text('Using ListView'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // 이벤트 헨들러
          print('First');
        },
      ),
      ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Flutter'),
        trailing: Icon(
          Icons.autorenew,
          // size: 50.0,
        ),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Contracts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'), // const 사용 불가.
      ),
      ListTile(
        title: Text('ListView'),
        subtitle: Text('Using ListView'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // 이벤트 헨들러
          print('First');
        },
      ),
      ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Flutter'),
        trailing: Icon(
          Icons.autorenew,
          // size: 50.0,
        ),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Contracts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'), // const 사용 불가.
      ),
      ListTile(
        title: Text('ListView'),
        subtitle: Text('Using ListView'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // 이벤트 헨들러
          print('First');
        },
      ),
      ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Flutter'),
        trailing: Icon(
          Icons.autorenew,
          // size: 50.0,
        ),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Contracts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'), // const 사용 불가.
      ),
      ListTile(
        title: Text('ListView'),
        subtitle: Text('Using ListView'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // 이벤트 헨들러
          print('First');
        },
      ),
      ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Flutter'),
        trailing: Icon(
          Icons.autorenew,
          // size: 50.0,
        ),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Contracts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('third'), // const 사용 불가.
      ),
    ],
  );
}

GridView secondPage() {
  return GridView.count(
    padding: EdgeInsets.all(10),
    crossAxisCount: 3, // 한 행에 배치할 위젯 수
    crossAxisSpacing: 10, // 가로로 위젯 간격
    mainAxisSpacing: 10, // 세로로 위젯 간격
    children: [
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.blue[100],
        alignment: Alignment.center,
        child: Text('1'),
      ),
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.blue[200],
        alignment: Alignment.center,
        child: Text('2'),
      ),
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.blue[300],
        alignment: Alignment.center,
        child: Text('3'),
      ),
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.blue[400],
        alignment: Alignment.center,
        child: Text('4'),
      ),
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.blue[500],
        alignment: Alignment.center,
        child: Text('5'),
      ),
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.blue[600],
        alignment: Alignment.center,
        child: Text('6'),
      ),
    ],
  );
}
