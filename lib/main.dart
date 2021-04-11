import 'package:chat/views/signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GiverChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn()
    );
  }
}