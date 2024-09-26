// readScreen.dart
import 'package:flutter/material.dart';
import '../mappers/MemoDBHelper.dart';
// import '../mappers/BookmarkDBHelper.dart';
import '../models/memo.dart';
import '../models/bookmark.dart';

class ReadScreen extends StatefulWidget {
  final MemoDBHelper dbHelper = MemoDBHelper();
  // final BookmarkDBHelper dbBookmarkHelper = BookmarkDBHelper();

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  late int no;
  late Future<Memo> _memo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments = ModalRoute.of(context)!.settings.arguments;

    if (arguments != null) {
      no = arguments as int;
      _memo = widget.dbHelper.getMemoInfo(no);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 정보'),
      ),
      body: FutureBuilder(
        // Future이 완료되기 전에도 화면을 렌더링할 수 있도록
        future: _memo,
        builder: (context, snapshot) {
          // snapshot: Future의 상태와 결과 등을 가진 객체
          if (snapshot.connectionState == ConnectionState.waiting) {
            // ConnectionState : Future의 상태 none -> waiting/active -> done
            return const Center(child: CircularProgressIndicator());
            // CircularProgressIndicator : 앱 진행사항을 원형으로 나타내는 위젯
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            // 실제 화면에 렌더링될 위젯 정의
            var result = snapshot.data;
            return _memoContent(result as Memo);
          }
        },
      ),
    );
  }

  Widget _memoContent(Memo memo) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${memo.no}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            '${memo.info}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/memo/update',
                    arguments: memo.no,
                  );
                },
                child: Text('수정'),
              ),
              IconButton(
                onPressed: () async {
                  // ! 주의
                  // 모든 항목에 정상적인 값 입력된 경우
                  Bookmark bookmark = Bookmark(mno: memo.no as int);
                  // widget.dbHelper.insertMemo(memo);
                  int result = await widget.dbHelper.insertBookmark(bookmark);

                  if (result > 0) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/memo/bookmark",
                      (route) => false,
                    );
                    // push되는 라우터 아래의 경로를 모두 제거 => 사실상 재호출
                  }
                },
                icon: Icon(Icons.bookmark_add_outlined),
              )
            ],
          )
        ],
      ),
    );
  }
}
