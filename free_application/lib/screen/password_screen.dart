import 'package:flutter/material.dart';
import 'dart:math';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  // int number = Random().nextInt(10); // 0~10 랜덤
  final _controller = TextEditingController();
  String _result = '';

  void _generateRandomNumber() {
    setState(() {
      final int? digitCount = int.tryParse(_controller.text);
      if (digitCount != null && digitCount > 0) {
        _result = _passwordString(digitCount);
      } else {
        _result = '유효한 자릿수를 입력해주세요.';
      }
    });
  }

  String _passwordString(int digitCount) {
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final randomString = Random();
    return List.generate(digitCount,
        (index) => characters[randomString.nextInt(characters.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("비밀번호 생성기")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '원하는 자릿수를 입력하세요.',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _generateRandomNumber,
              child: Text('비밀번호 생성'),
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
