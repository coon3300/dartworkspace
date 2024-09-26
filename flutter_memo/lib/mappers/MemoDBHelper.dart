// MemoDBHelper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/memo.dart';
import '../models/bookmark.dart';

// Mapper
class MemoDBHelper {
  // 자동 생성 -> 대문자 변경 했음.
  // 싱글톤
  static final MemoDBHelper _dbHelper = MemoDBHelper._init();

// 생성결과 Map

  MemoDBHelper._init() {}

  // factory 생성자 싱글톤 생성 시 사용.
  factory MemoDBHelper() {
    return _dbHelper;
  }

  // 실제 DB와 접속해서 처리하는 부분
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();

    return _database!;
  }

  Future<Database> initDatabase() async {
    // join 함수
    String path = join(await getDatabasesPath(), 'memo.db');

    return await openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute("""
        CREATE TABLE bookmarks(
          no INTEGER PRIMARY KEY AUTOINCREMENT,
          mno INTEGER
        )
        """);
      await db.execute("""
        CREATE TABLE memos(
          no INTEGER PRIMARY KEY AUTOINCREMENT,
          info TEXT,
          bookmark TEXT
        )
        """);
    });
  }

  // 북마크 전체 조회
  Future<List<Memo>> getBookmarks() async {
    Database db = await database; //   Database? _database; 이 (?)부분과 뭔가 관련 있음.
    List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT * FROM memos WHERE no In (SELECT mno FROM bookmarks)');
    // SELECT * FROM memos ORDER BY no
    return List.generate(
      result.length,
      (index) {
        Map<String, dynamic> memo = result[index];
        return Memo.from(memo); // 위와 같은 기능.
      },
    ); // List<Memo>
  }

  // 북마크 등록
  Future<int> insertBookmark(Bookmark bookmark) async {
    Database db = await database;
    return await db.insert('bookmarks', bookmark.toMap());
    // db.insert('bookmarks',{'no' : bookmark.no, 'mno' : bookmark.mno})
    // bookmark.toMap() => {'no' : bookmark.no, 'mno' : bookmark.mno}
  }

  // 전체 조회
  Future<List<Memo>> getMemos() async {
    Database db = await database; //   Database? _database; 이 (?)부분과 뭔가 관련 있음.
    List<Map<String, dynamic>> result = await db.query('memos', orderBy: 'no');
    // SELECT * FROM memos ORDER BY no

    // generate : for문과 같은 반복 기능함.
    return List.generate(
      result.length,
      (index) {
        Map<String, dynamic> memo = result[index];
        // return Memo.from({
        //   'no': memo['no'],
        //   'info': memo['info'],
        // });
        return Memo.from(memo); // 위와 같은 기능.
      },
    ); // List<Memo>
  }

  // 단건 조회
  Future<Memo> getMemoInfo(int no) async {
    Database db = await database;
    List<Map<String, dynamic>> result =
        await db.query('memos', where: 'no = ?', whereArgs: [no]);
    // SELECT * FROM memos WHERE no = ?
    Map<String, dynamic> memo = result[0];
    return Memo.from(memo);
  }

  // 등록
  Future<int> insertMemo(Memo memo) async {
    Database db = await database;
    return await db.insert('memos', memo.toMap());
    // db.insert('memos',{'no' : memo.no, 'info' : memo.info})
    // memo.toMap() => {'no' : memo.no, 'info' : memo.info}
  }

  // 수정
  Future<int> updateMemo(Memo memo) async {
    Database db = await database;
    return await db.update(
      'memos',
      memo.toMap(), // SET 절
      where: 'no = ?',
      whereArgs: [memo.no],
    );
    /*
    '''
      UPDATE $Table
      SET
      for(var column in columns.entries){
        $column.key = $column.value,
      }
      WHERE $where
    '''
    */
  }

  // 삭제
  Future<int> deleteMemo(int no) async {
    Database db = await database;
    return await db.delete(
      'memos',
      where: 'no = ?',
      whereArgs: [no],
    );
  }
}
