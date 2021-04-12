import 'package:chat/services/auth.dart';
import 'package:chat/widgets/app_bar.dart';
import 'package:chat/widgets/text.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameTextEditingController =
      new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();

  AuthMethods authMethods = new AuthMethods();

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  signMeUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      authMethods
          .signUpWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),
        body: isLoading
            ? Container(child: Center(child: CircularProgressIndicator()))
            : SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 50,
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Form(
                            key: formKey,
                            child: Column(children: [
                              TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return "Insira um nome de usuário";
                                    if (value.length < 4)
                                      return "Nome de usuário muito curto";

                                    return null;
                                  },
                                  controller: usernameTextEditingController,
                                  style: simpleTextStyle(),
                                  decoration:
                                      textFieldDecoration("Nome de usuário")),
                              TextFormField(
                                  validator: (value) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)
                                        ? null
                                        : "Email inválido";
                                  },
                                  controller: emailTextEditingController,
                                  style: simpleTextStyle(),
                                  decoration: textFieldDecoration("Email")),
                              TextFormField(
                                  validator: (value) {
                                    return value.length < 6
                                        ? "Senha curta, use 6+ caracteres"
                                        : null;
                                  },
                                  controller: passwordTextEditingController,
                                  obscureText: true,
                                  style: simpleTextStyle(),
                                  decoration: textFieldDecoration("Senha")),
                            ]),
                          ),
                          SizedBox(height: 8),
                          Container(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text("Esqueceu a senha?",
                                      style: simpleTextStyle()))),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () => signMeUp(),
                            child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      const Color(0xFF007EF4),
                                      const Color(0xFF2A75BC),
                                    ]),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text("Cadastrar-se",
                                    style: mediumTextStyle())),
                          ),
                          SizedBox(height: 16),
                          Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text("Cadastrar-se com o Google",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 17))),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Já tem uma conta? ",
                                  style: mediumTextStyle()),
                              Text("Entrar.",
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
