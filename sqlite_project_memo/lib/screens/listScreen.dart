// screens/listScreen.dart

import 'package:flutter/material.dart';
import '../mappers/MemoDBHelper.dart';
import '../models/memo.dart';

class ListScreen extends StatefulWidget {
  final MemoDBHelper dbHelper = MemoDBHelper();
  @override
  State<StatefulWidget> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Memo> _memoList = [];

  @override
  void initState() {
    // 초기화
    super.initState();

    widget.dbHelper.getMemos().then((result) {
      setState(() {
        _memoList = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 리스트'),
      ),
      body: ListView.builder(
        // 정해진 갯수 만큼 동일한 item을 적용.
        itemCount: _memoList.length,
        itemBuilder: (context, index) {
          Memo memo = _memoList[index];
          return Container(
            margin: EdgeInsets.all(8), // 각 항목 사이의 간격
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),

            child: ListTile(
              leading: Text('${memo.no}'),
              title: Text('${memo.info.padRight(20).substring(0, 20)}'),
              trailing: IconButton(
                onPressed: () async {
                  // 삭제
                  int result = await widget.dbHelper.deleteMemo(memo.no as int);

                  if (result > 0) {
                    setState(() {
                      _memoList.removeWhere(
                        (info) => info.no == memo.no,
                      );
                    });
                  }
                },
                icon: Icon(Icons.delete),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/memo/read',
                  arguments: memo.no,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              // 등록페이지로 전환
              Navigator.pushNamed(context, '/memo/bookmark');
            },
            child: Icon(Icons.bookmark),
            heroTag: null,
          ),
          FloatingActionButton(
            onPressed: () {
              // 등록페이지로 전환
              Navigator.pushNamedAndRemoveUntil(
                  context, '/memo/list', (route) => false);
            },
            child: Icon(Icons.home),
            heroTag: null,
          ),
          FloatingActionButton(
            onPressed: () {
              // 등록페이지로 전환
              Navigator.pushNamed(context, '/memo/insert');
            },
            child: Icon(Icons.create),
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
