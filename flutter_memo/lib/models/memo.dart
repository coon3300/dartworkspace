class Memo {
  int? no; // PRIMARY KEY
  late String info; // 데이터
  // late int bookmark;

  Memo({this.no, required this.info});
  // Memo({this.no, required this.info, required this.bookmark});

  // Select한 결과 : Map
  Memo.from(Map<String, dynamic> map) {
    no = map['no'] as int;
    info = map['info'] as String? ?? ''; // null이면 빈 문자열로 대체
    // bookmark = map['bookmark'] as int? ?? 0; // null이면 0으로 대체
  }

  // QeuryBinder 기반으로 정보를 넘길 경우 대비
  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'info': info,
      // 'bookmark': bookmark,
    };
  }
}
