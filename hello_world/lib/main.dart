import 'package:flutter/material.dart'; // 안드로이드

void main() => runApp(HelloWorld());

// 첫 번째로 실행될 위젯 구현
// StatelessWidget 클래스 : 변화없이 화면 표시만을 위한 위젯
class HelloWorld extends StatelessWidget {
  // build 실제 실행될 기본적인 위젯을 반환
  @override
  Widget build(BuildContext context) {
    // MaterialApp 클래스
    // 안드로이드 머터리얼 디자인을 적용을 위한 위젝
    return MaterialApp(
        title: 'First Flutter App',
        // Scaffold 클래스
        // : MaterialApp 내에서 실제적인 머티리얼 디자인의 기본적인 뼈대
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Hello World Demo'),
          ),
          body: const Center(
            child: const Text('Hello World'),
          ),
        ));
  }
}
