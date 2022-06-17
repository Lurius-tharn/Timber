// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timber/database/bdd_controller.dart';

import '../model/Profiles.dart';
import 'SwipeScreen.dart';

class MainScreen extends StatelessWidget {
  final userId;
  var dataLenght;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  var increment = 0;
  MainScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Column(
      children: [
        SizedBox(
            width: 600.0,
            height: 500.0,
            child: Center(
                child: FutureBuilder(
              future: BddController().getUsers(),
              builder: (context, AsyncSnapshot<List<Profile>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                }
                dataLenght = snapshot.data!.length;
                return ScrollablePositionedList.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                  itemBuilder: (context, item) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SwipeScreen(
                                  profile: snapshot.data![item],
                                  userId: userId),
                            ));
                      },
                      child: Container(
                        height: 250,
                        width: 250,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 5),
                        ),
                        child: Image.asset(
                            "assets/pic/${snapshot.data![item].picture}"),
                      )),
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                );
              },
            ))),
        Center(
          child: ElevatedButton(
            onPressed: () {
              increment >= dataLenght ? increment = 0 : increment += 2;

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
