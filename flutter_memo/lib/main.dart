import 'package:flutter/material.dart';

import 'screens/listScreen.dart';
import 'screens/insertScreen.dart';
import 'screens/readScreen.dart';
import 'screens/updateScreen.dart';
import 'screens/bookmarkListScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '메모',
      initialRoute: '/memo/list',
      routes: {
        // 전체 조회
        '/memo/list': (context) => ListScreen(),
        // 단건 조회
        '/memo/read': (context) => ReadScreen(),
        // 등록
        '/memo/insert': (context) => InsertScreen(),
        // 수정
        '/memo/update': (context) => UpdateScreen(),
        // 즐겨찾기
        '/memo/bookmark': (context) => BookmarkListScreen(),
      },
    );
  }
}
