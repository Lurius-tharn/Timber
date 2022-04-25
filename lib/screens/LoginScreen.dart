import 'package:flutter/material.dart';

import '../components/customFormField.dart';
import 'MainScreen.dart';

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
                const CustomFormField(
                  hintText: "login",
                  errorText: "Entrer votre mot de passe",
                ),

                CustomFormField(
                  hintText: "Mot  de passe",
                  errorText: "mdp incorrect",
                  validator: (val) {
                    if (val != null && val.length < 0)
                      return 'Enter valid email';
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      },
                      child: const Text('Se connecter'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {

                        //}
                      },
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
