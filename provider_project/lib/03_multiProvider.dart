// 03_multiProvider.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/counter.dart';
import './models/text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Counter with ChangeNotifier
        ChangeNotifierProvider<Counter>(
          create: (_) => Counter(),
        ),
        // Message with ChangeNotifier
        ChangeNotifierProvider<Messge>(
          create: (_) => Messge(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiProvider Test'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('현재 메세지 : ${Provider.of<Messge>(context).msg}'),
          ),
          Text('현재 메세지 : ${context.watch<Counter>().count}')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).incrementCount();
          context.read<Messge>().changeMsg('Hello, Flutter!');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
