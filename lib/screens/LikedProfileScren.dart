import 'package:flutter/material.dart';
import 'package:timber/model/Profiles.dart';
import 'package:timber/screens/DetailledProfileScreen.dart';

class LikedProfileScreen extends StatelessWidget {
  static const List<Profile> LikedProfiles = [
    Profile(
        nom: "Huscarl",
        prenom: "Lydia",
        description: "i am sworn to carry your burdens",
        picture: "pic/Lydia_Housecarl.png",
        departement: "95"),
    Profile(
        nom: "Huscarl",
        prenom: "Lydia",
        description: "i am sworn to carry your burdens",
        picture: "pic/Lydia_Housecarl.png",
        departement: "95"),
  ];

  const LikedProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: LikedProfiles.length,
        itemBuilder: (context, index) {
          return ListTile(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailledProfilePage(
                            nom: LikedProfiles[index].nom,
                            prenom: LikedProfiles[index].prenom)),
                  ),
              title: Text(LikedProfiles[index].nom),
              subtitle: Text(LikedProfiles[index].prenom),
              leading: Text(LikedProfiles[index].departement));
        });
  }
}
