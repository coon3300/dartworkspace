import 'package:flutter/material.dart';
import 'package:layout_project/screens/loginPage.dart';
import '../models/user.dart';

class MyInfoPage extends StatelessWidget {
  // late UserVO userInfo;
  late UserVO myInfo;

  // MyInfoPage() {
  //   userInfo = UserVO();
  // }

  // MyInfoPage(required UserVO myInfo) {
  //   this.myInfo = myInfo;
  // }
  MyInfoPage({required this.myInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Info Page'),
      ),
      body: SingleChildScrollView(
        // Table에서 리팩토링으로 wrap Column으로 생성.
        child: Column(
          children: [
            Table(
              // 공통된 레이아웃을 적용하고 싶을 경우
              border: TableBorder.all(),
              columnWidths: {
                // 세로줄에 해당하는 칸들의 크기에 따라서 가로 길이를 설정
                //0: IntrinsicColumnWidth(),
                // 특정 픽셀 만큼 가로 길이 설정
                0: FixedColumnWidth(100),
                // 나머지 세로 줄이 차지하고 남은 공간 전체를 가로 길이로 설정
                1: FlexColumnWidth(),
              },
              children: [
                // 반복되는 코드 getItemField() 함수로 만듬.
                // TableRow(children: [
                //   TableCell(child: Text('아이디')),
                //   TableCell(child: Text('Hong')),
                // ]),
                // TableRow(children: [
                //   TableCell(child: Text('비밀번호')),
                //   TableCell(child: Text('1234')),
                // ])

                for (var item in myInfo.toMap().entries)
                  getItemField(item.key, item.value)
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text('로그아웃'),
            )
          ],
        ),
      ),
    );
  }
}

TableRow getItemField(String name, String? data) {
  return TableRow(children: [
    TableCell(
      child: Text(
        '$name',
        style: TextStyle(
          fontSize: 30, // 글자 크기
          fontWeight: FontWeight.bold, // 글자 굵기
        ),
        textAlign: TextAlign.center, // 정렬
        softWrap: true, // 0: FixedColumnWidth(100) 초과하면 여러 줄로 표시됨.
      ),
    ),
    TableCell(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        '$data',
        style: TextStyle(
          fontSize: 30, // 글자 크기
          fontWeight: FontWeight.bold, // 글자 굵기
        ),
        textAlign: TextAlign.left, // 정렬
      ),
    )),
  ]);
}
