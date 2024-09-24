// TODO Implement this library.
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idEditingController = TextEditingController();
  final TextEditingController _pwdEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        // Center 정렬 안되서 Container 사용.
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 아이디를 입력받는 위젯
            TextField(
              controller: _idEditingController, //onSubmitted 보다 controller 사용.
              decoration: InputDecoration(
                labelText: '아이디',
                labelStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(),
              ),
            ),

            //비밀번호를 입력받는 위젯
            TextField(
              controller: _pwdEditingController,
              obscureText: true, // 비밀번호 **** 처리
              decoration: InputDecoration(
                labelText: '비밀번호',
                labelStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(),
              ),
            ),

            // 로그인, 취소 각각을 처리하는 위젯
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      String id = _idEditingController.text;
                      String pwd = _pwdEditingController.text;
                      print('$id, $pwd');
                    },
                    child: Text('로그인')),
                TextButton(
                    onPressed: () {
                      _idEditingController.clear();
                      _pwdEditingController.clear();
                    },
                    child: Text('취소')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
