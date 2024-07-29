import 'package:basic_widget/example/icon_widget.dart';
import 'package:basic_widget/example/image_widget.dart';
import 'package:basic_widget/example/safearea_widget.dart';
import 'package:basic_widget/example/text_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          //TextWidget(),
          // ImageWidget(),
          // IconWidget(),
          SafeareaWidget(),
    );
  }
}