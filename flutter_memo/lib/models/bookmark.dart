class Bookmark {
  int? no; // PRIMARY KEY
  // late String info; // 데이터
  late int mno; // 메모 번호

  // Bookmark({this.no, required this.info});
  Bookmark({this.no, required this.mno});

  // Select한 결과 : Map
  Bookmark.from(Map<String, dynamic> map) {
    this.no = map['no'] as int;
    // this.info = map['info'] as String;
    this.mno = map['mno'] as int;
  }

  // QeuryBinder 기반으로 정보를 넘길 경우 대비
  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'mno': mno,
    };
  }
}
