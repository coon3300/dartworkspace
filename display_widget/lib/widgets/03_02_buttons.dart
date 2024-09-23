import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  State<ButtonPage> createState() => _ButtonPaseState();
}

class _ButtonPaseState extends State<ButtonPage> {
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
            setState(() {
              _curIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  size: 30, color: _curIndex == 0 ? Colors.blue : Colors.black),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_drop_down_circle_rounded,
                  size: 30, color: _curIndex == 1 ? Colors.blue : Colors.black),
              label: "dropdown",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.zoom_in,
                  size: 30, color: _curIndex == 2 ? Colors.blue : Colors.black),
              label: "floating",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dangerous,
                  size: 30, color: _curIndex == 3 ? Colors.blue : Colors.black),
              label: "PopupMenuButton",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet,
                  size: 30, color: _curIndex == 4 ? Colors.blue : Colors.black),
              label: "IconButton",
            ),
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
        page = ButtonDemo('DropdownButton');
        break;
      case 2:
        page = ButtonDemo('FloatingActionButton');
        break;
      case 3:
        page = ButtonDemo('PopupMenuButton');
        break;
      case 4:
        page = ButtonDemo('IconButton');
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

// ButtonDemo
class ButtonDemo extends StatefulWidget {
  late dynamic _buttonClass;

  ButtonDemo(String selected) {
    switch (selected) {
      case 'DropdownButton':
        _buttonClass = _dropdownButtonState();
        break;
      case 'FloatingActionButton':
        _buttonClass = _floatActionButtonState();
        break;
      case 'PopupMenuButton':
        _buttonClass = _popupMenuButtonState();
        break;
      case 'IconButton':
        _buttonClass = _iconButtonState();
        break;
    }
  }

  @override
  State<ButtonDemo> createState() => _buttonClass;
}

// 1. DropdownButton
class _dropdownButtonState extends State<ButtonDemo> {
  String? _selectedValue = 'Apple';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton(
          value: _selectedValue, // 지금 현재 보여지는 데이터
          items: <String>['Apple', 'Banana', 'Orange']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          icon: const Icon(Icons.arrow_downward),
          iconSize: 100,
          style: const TextStyle(color: Colors.lightBlue),
          onChanged: (String? newValue) {
            setState(() {
              // 이벤트 발생 시 필수.
              _selectedValue = newValue;
            });
            // print(_selectedValue);
          }),
    );
  }
}

// 2. FloatingActionButton
class _floatActionButtonState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Press to button'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // 버튼 클릭
          },
          child: Icon(Icons.add),
        ));
  }
}

// 3. PopupMenuButton
enum RGB { red, green, blue }

class _popupMenuButtonState extends State<ButtonDemo> {
  RGB _selection = RGB.red;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<RGB>(
        onSelected: (RGB result) {
          setState(() {
            _selection = result;
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<RGB>>[
          PopupMenuItem<RGB>(
            value: RGB.red,
            child: Text('Red'),
          ),
          PopupMenuItem<RGB>(
            value: RGB.green,
            child: Text('Green'),
          ),
          PopupMenuItem<RGB>(
            value: RGB.blue,
            child: Text('Blue'),
          ),
        ],
      ),
    );
  }
}

// 4. IconButton
class _iconButtonState extends State<ButtonDemo> {
  int _number = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _number++;
              });
            },
            icon: Icon(Icons.add_box),
            iconSize: 100,
            tooltip: 'Add 1', // 길게 누르면 툴팁 나옴.
          ),
          Text('Number : $_number')
        ],
      ),
    );
  }
}
