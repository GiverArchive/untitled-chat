import 'package:chat/views/signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GiverChat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xFF145C9E),
            scaffoldBackgroundColor: Color(0xFF1F1F1F),
            primarySwatch: Colors.blue),
        home: SignIn());
  }
}
