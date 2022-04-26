import 'package:flutter/material.dart';
import 'package:timber/model/Profiles.dart';
import 'package:timber/screens/LikedProfileScren.dart';

class SwipeScreen extends StatelessWidget {
  final Profile profile;

  const SwipeScreen({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
                          pics,
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
                                onPressed: () {}),
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
                  builder: (context) => const LikedProfileScreen()),
            );
          },
          tooltip: 'Liked',
          child: const Icon(Icons.monitor_heart),
        ));
  }
}
