import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DialogPage(),
    );
  }
}

class DialogPage extends StatefulWidget {
  @override
  State<DialogPage> createState() => _DialogPage();
}

class _DialogPage extends State<DialogPage> {
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
      ),
      body: _getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _curIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: _curIndex == 0 ? Colors.blue : Colors.black54,
                ),
                label: "home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.iso,
                  size: 30,
                  color: _curIndex == 1 ? Colors.blue : Colors.black54,
                ),
                label: "simple"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.arrow_right_alt,
                  size: 30,
                  color: _curIndex == 2 ? Colors.blue : Colors.black54,
                ),
                label: "alert"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.check_circle_outline,
                  size: 30,
                  color: _curIndex == 3 ? Colors.blue : Colors.black54,
                ),
                label: "show"),
          ]),
    );
  }

  Widget _getCurrentPage() {
    late Widget page;
    switch (_curIndex) {
      case 0:
        page = homePage();
        break;
      case 1:
        page = DialogDemo('Simple');
        break;
      case 2:
        page = DialogDemo('Alert');
        break;
      case 3:
        page = DialogDemo('Show');
        break;
    }
    return page;
  }
}

Container homePage() {
  return Container(
    alignment: Alignment.center,
    child: const Text(
      'Dialog Page',
      style: TextStyle(color: Colors.blue, fontSize: 30),
    ),
  );
}

class DialogDemo extends StatefulWidget {
  late dynamic _selelctedClass;

  DialogDemo(String selected) {
    switch (selected) {
      case 'Simple':
        _selelctedClass = _simpleDialogState();
        break;
      case 'Alert':
        _selelctedClass = _alertDialogState();
        break;
      /*
      case 'Show':
        _selelctedClass = _showDialogState();
        break;
        */
    }
  }

  @override
  State<DialogDemo> createState() => _selelctedClass;
}

// 1. SimpleDialog
class _simpleDialogState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SimpleDialog(),
    );
  }
}

// 2. AlertDialog
class _alertDialogState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(),
    );
  }
}
/*
// 3. showdialog
class _showDialogState extends State<DialogDemo>{ 
  @override
  Widget build(BuildContext context) {
    return Center(
          child: TextButton(
            onPressed: ()=> _dialogBuilder(context), 
            child: const Text('show')
          )
    );
  }
}


Future<void> _dialogBuilder(BuildContext context) {

  return showDialog();
}

*/