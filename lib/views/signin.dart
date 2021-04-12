import 'package:chat/widgets/app_bar.dart';
import 'package:chat/widgets/text.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarSignIn(context),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 50,
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                        style: simpleTextStyle(),
                        decoration: textFieldDecoration("Email")),
                    TextField(
                        style: simpleTextStyle(),
                        decoration: textFieldDecoration("Password")),
                    SizedBox(height: 8),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text("Forgot password?",
                                style: simpleTextStyle()))),
                    SizedBox(height: 8),
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0xFF007EF4),
                              const Color(0xFF2A75BC),
                            ]),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text("Sign in", style: mediumTextStyle())),
                    SizedBox(height: 16),
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text("Sign in with Google",
                            style: TextStyle(
                                color: Colors.black87, fontSize: 17))),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have account? ", style: mediumTextStyle()),
                        Text("Register now!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                decoration: TextDecoration.underline))
                      ],
                    ),
                    SizedBox(height: 50)
                  ],
                )),
          ),
        ));
  }
}
