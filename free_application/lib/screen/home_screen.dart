import 'package:flutter/material.dart';
import 'package:free_application/screen/password_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("비밀번호를 만듭니다"),
      ),
      body: TabBarView(
        children: [PasswordScreen()],
      ),
    );
  }
}
