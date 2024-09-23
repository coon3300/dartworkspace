// widgets/03_01_buttons.dart

import 'package:flutter/material.dart';

Column buttonListOne() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      // textButton(),
      // outlinedButton(),
      // elevatedButton(),
      // wrapButton(textButtonIcon()),

      wrapButton(textButton()),
      wrapButton(outlinedButton()),
      wrapButton(elevatedButton()),
      wrapButton(textButtonIcon()),
      overflowBar(),
      // wrapButton(overflowBar()),
    ],
  );
}

Padding wrapButton(Widget button) {
  return Padding(
    // padding: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(50),
    child: button,
  );
}

// 1.TextButton <- FlatButton
TextButton textButton() {
  return TextButton(
    onPressed: () {
      //버튼 클릭
    },
    onLongPress: () {
      // 버튼 길게 클릭
    },
    style: TextButton.styleFrom(
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.white,
    ),
    child: Text(
      'TextButton',
      style: TextStyle(
        fontSize: 20.0,
      ),
    ),
  );
}

// 2. OutlinedButton -< OutlineButton
OutlinedButton outlinedButton() {
  return OutlinedButton(
    onPressed: () {},
    onLongPress: () {},
    style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        side: BorderSide(
          color: Colors.lightBlue,
          width: 5.0,
          style: BorderStyle.solid,
        )),
    child: Text(
      'OutlinedButton',
      style: TextStyle(
        fontSize: 20.0,
      ),
    ),
  );
}

// 3. elevatedButton <- RasiedButton
ElevatedButton elevatedButton() {
  return ElevatedButton(
    onPressed: () {},
    onLongPress: () {},
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.lightBlue,
      elevation: 20.0,
    ),
    child: Text(
      'ElevatedButton',
      style: TextStyle(
        fontSize: 20,
      ),
    ),
  );
}

// 4. TextButton.icon
TextButton textButtonIcon() {
  return TextButton.icon(
    onPressed: null, // 버튼 비활성화 null
    label: Text('Go Home'),
    icon: Icon(Icons.home, size: 50),
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,

      // 비활성화 색 변경 diabled
      disabledForegroundColor: Colors.pink.withOpacity(0.20),
      disabledBackgroundColor: Colors.black.withOpacity(0.20),
    ),
  );
}

// 5. OverflowBar : 화면에 끝 정렬해서 버튼 나타나게 해 줌.
OverflowBar overflowBar() {
  return OverflowBar(
    // 기본
    alignment: MainAxisAlignment.center, // 자식들의 정렬 방식
    spacing: 10,
    overflowAlignment: OverflowBarAlignment.end, // overflow 시 자식들의 정렬 방식
    overflowSpacing: 5,
    children: [
      textButton(),
      outlinedButton(),
      textButtonIcon()
      // elevatedButton(),
    ],
  );
}
