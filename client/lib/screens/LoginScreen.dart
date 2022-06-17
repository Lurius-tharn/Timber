// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:timber/database/bdd_controller.dart';
import 'package:timber/screens/MainScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tinber",
      home: Scaffold(
        appBar: AppBar(title: Text(DateTime.now().toIso8601String())),
        body: const LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormStatefulWidgetState();
}

class _LoginFormStatefulWidgetState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          key: _formKey,
          child: SizedBox(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // A facto
                Center(
                    child: Row(
                  children: [
                    const Text("Login",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                        )),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre login';
                          }
                          return null;
                        },
                        controller: myController1,
                        decoration: const InputDecoration(
                            hintText: 'Login',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0)),
                      ),
                    )
                  ],
                )),

                Center(
                    child: Row(
                  children: [
                    const Text('Mot de passe',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                        )),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: myController2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre mdp';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Mot de passe',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0)),
                      ),
                    )
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        BddController()
                            .login(myController1.value.text,
                                myController2.value.text)
                            .then((value) => {
                                  if (!value.isNaN)
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen(userId: value)),
                                      )
                                    }
                                });

                        // BddController().getAllStudent().then((value) => {
                        //       log(value ? "oui" : "non"),
                        //       if (value)
                        //         {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) => MainScreen()),
                        //           )
                        //         }
                        //     });
                      },
                      child: const Text('Se connecter'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('S\'inscrire'),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
