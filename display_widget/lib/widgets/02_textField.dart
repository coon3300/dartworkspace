import 'package:flutter/material.dart';

ListView textInputPage(BuildContext context) {
  TextEditingController editingController = TextEditingController();
  return ListView(
    children: [
      Text('You Can Input Text.'),
      TextField(),
      SizedBox(height: 20), // 공간을 강제로 잡는 위젯
      TextField(
        decoration: InputDecoration(
          labelText: 'Input Name',
          helperText: 'Korean language support', // = placeholder
        ),
        onSubmitted: (value) {
          // 입력받은 값을 다루는 곳
          print('======================= result : $value');
        },
      ),
      TextField(
        controller: editingController,
        decoration: InputDecoration(
          labelText: 'Input Info',
        ),
      ),
      TextButton(
        onPressed: () {
          String value = editingController.text;
          print('Button : $value');
        },
        child: Text('확인'),
      ),
      TextField(
        controller: editingController, // 같은 컨트롤러 사용 시 복사됨
        decoration: InputDecoration(
          labelText: 'Input Info Copy',
        ),
      ),
    ],
  );
}
