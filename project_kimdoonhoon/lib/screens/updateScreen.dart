// screens/UpdateScreen.dart

import 'package:flutter/material.dart';
import '../mappers/MemoDBHelper.dart';
import '../models/memo.dart';

class UpdateScreen extends StatefulWidget {
  final MemoDBHelper dbHelper = MemoDBHelper();
  @override
  State<StatefulWidget> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _memoEditingController = TextEditingController();
  // final TextEditingController _levelEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // late Memo memo;
  late int no;
  late int level;

  // initState에서는 context사용할 수 없어서 didChangeDependencies 사용함.
  // 둘다 build 전에 실행됨.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Navigator로 넘겨받은 arguments를 담는 객체
    final arguments = ModalRoute.of(context)!.settings.arguments;

    if (arguments != null) {
      no = arguments as int;
      // memo = arguments as Memo;
      // no = memo.no as int;

      // widget.dbHelper.getMemoInfo(no).then((resut) {
      widget.dbHelper.getMemoInfo(no).then((result) {
        _memoEditingController.text = result.info;
        level = result.level;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 수정'),
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
                  labelText: '정보',
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
                ElevatedButton(
                  // async 추가함.
                  onPressed: () async {
                    // ! 주의
                    if (_formKey.currentState!.validate()) {
                      // 모든 항목에 정상적인 값 입력된 경우
                      String info = _memoEditingController.text;
                      // Memo memo = Memo(no: no, info: info, level: level);
                      Memo memo = Memo(no: no, info: info, level: level);

                      int result = await widget.dbHelper.updateMemo(memo);

                      if (result > 0) {
                        // Navigator.pushNamedAndRemoveUntil(
                        //   context,
                        //   "/memo/read",
                        //   // (route) => false, // 전체 삭제
                        //   ModalRoute.withName('/memo/list'), // 지정된 위치까지
                        //   arguments: memo.no,
                        // );
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/memo/read",
                          (route) => false, // 전체 삭제
                          arguments: memo.no,
                        );
                        // push되는 라우터 아래의 경로를 모두 제거 => 사실상 재호출
                      }
                    }
                  },
                  child: Text('수정'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('취소'),
                ),
              ],
            )
          ],
        ),
      ), //
    );
  }
}
