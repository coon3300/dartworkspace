// BookmarkDBHelper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/bookmark.dart';

// Mapper
class BookmarkDBHelper {
  // 자동 생성 -> 대문자 변경 했음.
  // 싱글톤
  static final BookmarkDBHelper _dbHelper = BookmarkDBHelper._init();

// 생성결과 Map

  BookmarkDBHelper._init() {}

  // factory 생성자 싱글톤 생성 시 사용.
  factory BookmarkDBHelper() {
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
    String path = join(await getDatabasesPath(), 'bookmark.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE bookmarks(
          no INTEGER PRIMARY KEY AUTOINCREMENT,
          mno INTEGER
        )
        ''');
    });
  }

  // 전체 조회
  Future<List<Bookmark>> getBookmarks() async {
    Database db = await database; //   Database? _database; 이 (?)부분과 뭔가 관련 있음.
    List<Map<String, dynamic>> result =
        // await db.query('bookmarks', orderBy: 'no');
        await db.rawQuery(
            'SELECT * FROM memos WHERE no in (SELECT mno FROM bookmarks)');

    // SELECT * FROM memos WHERE no in (SELECT mno FROM bookmark)

    // generate : for문과 같은 반복 기능함.
    return List.generate(
      result.length,
      (index) {
        Map<String, dynamic> bookmark = result[index];
        // return Bookmark.from({
        //   'no': bookmark['no'],
        //   'mno': bookmark['mno'],
        // });
        return Bookmark.from(bookmark); // 위와 같은 기능.
      },
    ); // List<Bookmark>
  }

  // 단건 조회
  // 전체 : Future<List<Bookmark>> -> 단건 : Future<Bookmark>
  Future<Bookmark> getBookmarkInfo(int no) async {
    Database db = await database;
    List<Map<String, dynamic>> result =
        await db.query('bookmarks', where: 'mno = ?', whereArgs: [no]);

    // SELECT * FROM bookmarks WHERE mno = ?
    Map<String, dynamic> bookmark = result[0];
    return Bookmark.from(bookmark);
  }

  // 등록
  Future<int> insertBookmark(Bookmark bookmark) async {
    Database db = await database;
    return await db.insert('bookmarks', bookmark.toMap());
    // db.insert('bookmarks',{'no' : bookmark.no, 'mno' : bookmark.mno})
    // bookmark.toMap() => {'no' : bookmark.no, 'mno' : bookmark.mno}
  }

  // 수정
  Future<int> updateBookmark(Bookmark bookmark) async {
    Database db = await database;
    return await db.update(
      'bookmarks',
      bookmark.toMap(), // SET 절
      where: 'no = ?',
      whereArgs: [bookmark.no],
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
  Future<int> deleteBookmark(int no) async {
    Database db = await database;
    return await db.delete(
      'bookmarks',
      where: 'no = ?',
      whereArgs: [no],
    );
  }
}
