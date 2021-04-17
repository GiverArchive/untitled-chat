import 'package:chat/helper/authenticate.dart';
import 'package:chat/services/auth.dart';
import 'package:chat/views/search.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  AuthMethods authMethods = new AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png", height: 50),
        actions: [
          GestureDetector(
              onTap: () {
                authMethods.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Authenticate()));
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.exit_to_app)))
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
          }, child: Icon(Icons.search)),
    );
  }
}
