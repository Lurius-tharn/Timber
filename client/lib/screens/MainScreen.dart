import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timber/database/bdd_controller.dart';

import '../model/Departement.dart';
import '../model/Profiles.dart';
import 'SwipeScreen.dart';

class MainScreen extends StatelessWidget {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  var increment = 0;
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

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Align(
        child: Column(
      children: [
        SizedBox(
            width: 600.0,
            height: 500.0,
            child: Center(
                child: FutureBuilder(
              future: BddController().getUsers(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                }
                return ScrollablePositionedList.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                  itemBuilder: (context, item) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SwipeScreen(
                                    profile: Profile(
                                        departement: Departement(
                                            nom: '', num: 0, ville: ''),
                                        description: '',
                                        nom: '',
                                        picture: '',
                                        pictures: [],
                                        prenom: ''),
                                  )),
                        );
                      },
                      child: Container(
                        height: 250,
                        width: 250,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 5),
                        ),
                        child: Image.asset(snapshot.data![item]!["photo"]),
                      )),
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                );
              },
            ))),
        Center(
          child: ElevatedButton(
            onPressed: () {
              increment >= LikedProfiles.length
                  ? increment = 0
                  : increment += 2;

              itemScrollController.scrollTo(
                  index: increment,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOutCubic);
            },
            child: const Text('Suivant'),
          ),
        )
      ],
    ));
    //       ),
    // );
  }
}
