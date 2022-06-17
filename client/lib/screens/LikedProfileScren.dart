// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:timber/database/bdd_controller.dart';
import 'package:timber/screens/DetailledProfileScreen.dart';

class LikedProfileScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final userId;

  const LikedProfileScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BddController().getLikedMembers(userId),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailledProfilePage(
                                    profile: snapshot.data![index],
                                  )),
                        ),
                    title: Text(snapshot.data![index].nom),
                    subtitle: Text(snapshot.data![index].prenom),
                    leading:
                        Text(snapshot.data![index].departement.num.toString()));
              });
        });
  }
}
