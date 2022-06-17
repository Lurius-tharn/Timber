import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:timber/model/Departement.dart';

import '../model/Profiles.dart';

class BddController {
  Future<int> login(login, password) async {
    String baseUrl = "http://10.0.2.2:4548/Timber/connecter/$login/$password";
    var response = await http.get(Uri.parse(baseUrl));
    var json = jsonDecode(response.body);
    return json[0]["id"];
  }

  Future<Profile> getUserFromId(var userID) async {
    String baseUrl = "http://10.0.2.2:4548/Timber/membres/$userID";

    var response = await http.get(Uri.parse(baseUrl));
    var json = jsonDecode(response.body);
    return usersMapper(json);
  }

  Profile usersMapper(var json) {
    Departement dept = Departement(num: 0, nom: "", ville: "");
    String pics = json["pictures"];
    getDepartementData(json["dept"]).then((value) =>
        dept = Departement(num: value.num, nom: value.nom, ville: value.ville));
    return Profile(
        userId: json["id"],
        nom: json["nom"],
        prenom: json["prenom"],
        description: json["description"],
        picture: json["photo"],
        departement: dept,
        pictures: pics.split(","));
  }

  Future<List<Profile>> getUsers() async {
    List<Profile> listeProfiles = [];
    String baseUrl = "http://10.0.2.2:4548/Timber/membres";

    var response = await http.get(Uri.parse(baseUrl));
    log(response.body);

    var json = jsonDecode(response.body);
    for (var item in json) {
      listeProfiles.add(usersMapper(item));
    }
    log(listeProfiles.toString());
    return listeProfiles;
  }

  Future<Departement> getDepartementData(var numDepartement) async {
    String baseUrl = "http://10.0.2.2:4548/Timber/dept/$numDepartement";

    var response = await http.get(Uri.parse(baseUrl));

    var json = jsonDecode(response.body);

    return Departement(
        num: json[0]['num'], nom: json[0]['nom'], ville: json[0]['ville']);
  }

  Future addLikedMember(var idUser, idLiked) async {
    return await http.post(Uri.parse('http://10.0.2.2:4548/Timber/liked'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{"idUser": idUser, "idLiked": idLiked}));
  }

  Future<List<Profile>> getLikedMembers(var idUser) async {
    List<Profile> listeLikes = [];
    String baseUrl = "http://10.0.2.2:4548/Timber/liked/$idUser";

    var response = await http.get(Uri.parse(baseUrl));
    log(response.body);

    var json = jsonDecode(response.body);
    for (var item in json) {
      getUserFromId(item["membre"]).then((value) => listeLikes.add(value));
    }

    return listeLikes;
  }
}
