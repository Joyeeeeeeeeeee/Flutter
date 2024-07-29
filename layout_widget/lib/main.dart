import 'package:flutter/material.dart';
import 'package:layout_widget/models/students.dart';
import 'package:layout_widget/screens/detail_screen.dart';
import 'package:layout_widget/screens/gridview_screen.dart';
import 'package:layout_widget/screens/listview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 🧊 state
  List<Student> list = [];

  @override
  void initState() {
    super.initState();
    list.add(Student(imagePath: "image/student1.png", name: "파이리", age: 10));
    list.add(Student(imagePath: "image/student2.jpg", name: "꼬부기", age: 15));
    list.add(Student(imagePath: "image/student3.png", name: "이상해씨", age: 12));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "리스트 뷰",
        home: ListviewScreen(list: list));
    // GridviewScreen(list: list));
    // DetailScreen());
  }
}
