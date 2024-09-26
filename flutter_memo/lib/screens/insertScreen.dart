// screens/InsertScreen.dart

import 'package:flutter/material.dart';
import '../mappers/MemoDBHelper.dart';
import '../models/memo.dart';

class InsertScreen extends StatefulWidget {
  final MemoDBHelper dbHelper = MemoDBHelper();
  @override
  State<StatefulWidget> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  final TextEditingController _memoEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 등록'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey, //
              child: TextFormField(
                maxLines: 5,
                controller: _memoEditingController,
                decoration: InputDecoration(
                  labelText: '메모',
                  helperText: 'memo',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  // onSubmit 시 값 체크
                  if (value == null || value.isEmpty) {
                    return '입력한 정보가 없습니다.'; // 잘못 입력한 경우
                  }
                  return null; // 정상적으로 입력한 경우
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  // async 추가함.
                  onPressed: () async {
                    // ! 주의
                    if (_formKey.currentState!.validate()) {
                      // 모든 항목에 정상적인 값 입력된 경우
                      String info = _memoEditingController.text;
                      Memo memo = Memo(info: info);
                      // widget.dbHelper.insertMemo(memo);
                      int result = await widget.dbHelper.insertMemo(memo);

                      if (result > 0) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/memo/list",
                          (route) => false,
                        );
                        // push되는 라우터 아래의 경로를 모두 제거 => 사실상 재호출
                      }
                    }
                  },
                  child: Text('등록'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('취소'),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              // 등록페이지로 전환
              Navigator.pushNamedAndRemoveUntil(
                  context, '/memo/list', (route) => false);
            },
            child: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
