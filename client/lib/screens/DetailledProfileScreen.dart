// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:timber/screens/LikedProfileScren.dart';
import 'package:timber/screens/LoginScreen.dart';

import '../model/Profiles.dart';

class DetailledProfilePage extends StatelessWidget {
  final Profile profile;

  const DetailledProfilePage({Key? key, required this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LikedProfileScreen(
                          userId: profile.userId,
                        )),
              );
            },
            icon: const Icon(Icons.connect_without_contact)),
        title: Text('${profile.nom} ${profile.prenom}'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              icon: const Icon(Icons.connect_without_contact)),
        ],
      ),
      body: Center(
          child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [Text(profile.nom), Text(profile.prenom)],
            ),
            Image.asset(
              profile.picture,
              height: 170,
              width: 170,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Center(
            child: Text(profile.description),
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
              child: const Text('Contacter'),
            ),
          ),
        )
      ])),
    );
  }
}
