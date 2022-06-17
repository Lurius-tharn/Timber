// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:timber/database/bdd_controller.dart';
import 'package:timber/model/Profiles.dart';
import 'package:timber/screens/LikedProfileScren.dart';

class SwipeScreen extends StatelessWidget {
  final Profile profile;
  final int userId;
  const SwipeScreen({Key? key, required this.profile, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(children: <Widget>[
                      for (var pics in profile.pictures)
                        Image.asset(
                          "assets/pic/$pics",
                          height: 100,
                          width: 90,
                        ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Center(
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.arrow_back),
                                tooltip: 'Dislike Ew',
                                onPressed: () {}),
                            IconButton(
                                icon: const Icon(Icons.arrow_forward),
                                tooltip: 'Like ! ',
                                onPressed: () {
                                  BddController()
                                      .addLikedMember(userId, profile.userId);
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LikedProfileScreen(
                        userId: userId,
                      )),
            );
          },
          tooltip: 'Liked',
          child: const Icon(Icons.monitor_heart),
        ));
  }
}
