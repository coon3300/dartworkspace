import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/models/counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider(
        create: (_) => Counter(), // 사용x(?). (_)로 표시.
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카운터'),
      ),
      body: Center(
        // context.watch<Counter>() = Counter 객체
        child: Text(
          '현재 숫자 : ${context.watch<Counter>().count}',
          style: TextStyle(
            fontSize: 50,
          ),
        ), // watch : 출력, 변경 시 빌드.
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<Counter>().incrementCount(), // read : 변경 주로 버튼.
        child: Icon(Icons.add),
      ),
    );
  }
}
