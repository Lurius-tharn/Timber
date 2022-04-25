import 'package:flutter/material.dart';

class DetailledProfilePage extends StatelessWidget {
  final String nom;
  final String prenom;

  const DetailledProfilePage(
      {Key? key, required this.nom, required this.prenom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.connect_without_contact)),
        title: Text('$nom $prenom'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.connect_without_contact)),
          IconButton(
              onPressed: () {},
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
              children: [Text(nom), Text(prenom)],
            ),
            Image.asset(
              'pic/Lydia_Housecarl.png',
              height: 170,
              width: 170,
            ),
          ],
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
