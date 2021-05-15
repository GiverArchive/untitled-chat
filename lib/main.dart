import 'package:chat/helper/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        primarySwatch: Colors.blue,
      ),
      home: Authenticate(),
    );
  }
}
