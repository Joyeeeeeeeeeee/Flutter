import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_app/screen/board/insert_screen.dart';
import 'package:http_app/screen/board/list_screen.dart';
import 'package:http_app/screen/board/read_screen.dart';
import 'package:http_app/screen/board/update_screen.dart';
import 'package:http_app/screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/main',
      routes: {
        '/main': (context) => MainScreen(),
        '/board/list': (context) => ListScreen(),
        '/board/read': (context) => ReadScreen(),
        '/board/insert': (context) => InsertScreen(),
        '/board/update': (context) => UpdateScreen(),
      },
    );
  }
}
