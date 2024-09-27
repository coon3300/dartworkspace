class Memo {
  int? no; // PRIMARY KEY
  late String info; // 데이터
  late int level;

  // Memo({this.no, required this.info});
  Memo({this.no, required this.info, required this.level});

  // Select한 결과 : Map
  Memo.from(Map<String, dynamic> map) {
    this.no = map['no'] as int;
    this.info = map['info'] as String;
    this.level = map['level'] as int;
  }

  // QeuryBinder 기반으로 정보를 넘길 경우 대비
  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'info': info,
      'level': level,
    };
  }
}
