import 'package:flutter/material.dart';
import 'package:http_app/models/board.dart';

class ReadScreen extends StatelessWidget {
  final Board board;
  const ReadScreen({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 조회"),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return {"수정하기", "삭제하기"}.map((String menu) {
                return PopupMenuItem<String>(
                  child: Text(menu),
                  value: menu,
                );
              }).toList();
            },
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "번호 : ${board.no}",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text("제목",
                style: const TextStyle(
                  fontSize: 15.0,
                )),
            Text(
              "${board.title}",
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "작성자",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              "${board.writer}",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "내용",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            Text(
              "${board.content}",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "등록 일자  ${board.regDate}",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
