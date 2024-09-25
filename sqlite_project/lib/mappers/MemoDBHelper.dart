// MemoDBHelper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MemoDBHelper {
  // 자동 생성 -> 대문자 변경 했음.
  // 싱글톤
  static final MemoDBHelper _dbHelper = MemoDBHelper._init();

  MemoDBHelper._init() {}

  // factory 생성자 싱글톤 생성 시 사용.
  factory MemoDBHelper() {
    return _dbHelper;
  }

  // 실제 DB와 접속해서 처리하는 부분
  Database? _database;

  Future<Database> get datagase async {
    if (_database != null) return _database!;

    _database = await initDatabase();

    return _database!;
  }

  Future<Database> initDatabase() async {
    // join 함수
    String path = join(await getDatabasesPath(), 'memo.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE memos(
          no INTEGER PRIMARY KEY AUTOINCREMENT,
          info TEXT
        )
        ''');
    });
  }

  // 전체 조회
  Future<List<Memo>> getMemos() {}

  // 단건 조회

  // 등록

  // 수정

  // 삭제
}
