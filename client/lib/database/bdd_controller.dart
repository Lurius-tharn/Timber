import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:timber/model/Departement.dart';

import '../model/Profiles.dart';

class BddController {
  // Appel a la base de données permettant à l'utilisateur de se connecter
  Future<int> login(login, password) async {
    String baseUrl = "http://10.0.2.2:4548/Timber/connecter/$login/$password";
    var response = await http.get(Uri.parse(baseUrl));
    var json = jsonDecode(response.body);
    return json[0]["id"];
  }

  // Appel a la base de données permettant de récuperer les informations dun utilisateur en fonction de son id
  Future<Profile> getUserFromId(var userID) async {
    String baseUrl = "http://10.0.2.2:4548/Timber/membres/$userID";

    var response = await http.get(Uri.parse(baseUrl));
    var json = jsonDecode(response.body);
    return usersMapper(json);
  }
  // Fonction permettant de créer un Objet de la classe Profile en fonction d'un objetJSON

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

  // Appel a la base de données permettant de récuperer les informations des utilisateurs

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
  // Appel a la base de données permettant de récuperer les informations d'un departement

  Future<Departement> getDepartementData(var numDepartement) async {
    String baseUrl = "http://10.0.2.2:4548/Timber/dept/$numDepartement";

    var response = await http.get(Uri.parse(baseUrl));

    var json = jsonDecode(response.body);

    return Departement(
        num: json[0]['num'], nom: json[0]['nom'], ville: json[0]['ville']);
  }
  // Appel a la base de données permettant d'ajouter un profil dans la table "Like"'

  Future addLikedMember(var idUser, idLiked) async {
    return await http.post(Uri.parse('http://10.0.2.2:4548/Timber/liked'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{"idUser": idUser, "idLiked": idLiked}));
  }

  // Appel a la base de données permettant de recuperer les utilisateurs likés.²
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
