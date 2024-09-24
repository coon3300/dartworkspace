// TODO Implement this library.
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        // Center 정렬 안되서 Container 사용.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 아이디를 입력받는 위젯
            TextField(),

            //비밀번호를 입력받는 위젯
            TextField(),

            // 로그인, 취소 각각을 처리하는 위젯
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: Text('로그인')),
                TextButton(onPressed: () {}, child: Text('취소')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
