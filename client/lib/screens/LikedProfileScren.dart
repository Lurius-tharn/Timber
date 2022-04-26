import 'package:flutter/material.dart';
import 'package:timber/model/Profiles.dart';
import 'package:timber/screens/DetailledProfileScreen.dart';

import '../model/Departement.dart';

class LikedProfileScreen extends StatelessWidget {
  static List<Profile> LikedProfiles = [
    Profile(
        nom: "Huscarl",
        prenom: "Lydia",
        description: "i am sworn to carry your burdens",
        picture: "pic/Lydia_Housecarl.png",
        departement: Departement(num: 95, nom: "", ville: ""),
        pictures: [
          "pic/Lydia_Housecarl.png",
          "pic/Lydia_Housecarl.png",
          "pic/Lydia_Housecarl.png",
        ]),
    Profile(
        nom: "Huscarl",
        prenom: "Lydia",
        description: "i am sworn to carry your burdens",
        picture: "pic/Lydia_Housecarl.png",
        departement: Departement(num: 95, nom: "", ville: ""),
        pictures: [
          "pic/Lydia_Housecarl.png",
          "pic/Lydia_Housecarl.png",
          "pic/Lydia_Housecarl.png",
        ]),
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
                              profile: LikedProfiles[index],
                            )),
                  ),
              title: Text(LikedProfiles[index].nom),
              subtitle: Text(LikedProfiles[index].prenom),
              leading: Text(LikedProfiles[index].departement.num.toString()));
        });
  }
}
