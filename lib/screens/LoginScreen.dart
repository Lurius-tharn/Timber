import 'package:flutter/material.dart';

import '../components/customFormField.dart';
import 'LikedProfileScren.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
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
    child:
    return Form(
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

              const CustomFormField(
                hintText: "Mot  de passe",
                errorText: "mdp incorrect",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LikedProfileScreen()),
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
        ));
  }
}
