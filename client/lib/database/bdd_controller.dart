import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';
import 'package:timber/model/Departement.dart';

import '../model/Profiles.dart';

class BddController {
  getCon() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: '10.0.2.2', port: 3306, user: 'root', db: 'Timber'));
    return conn;
  }

  Future<bool> getUser(login, password) async {
    var isExist = false;
    String baseUrl =
        "http://10.0.2.2:4548/Timber/connecter?login=%$login&password=$password";

    var response = await http.get(Uri.parse(baseUrl));

    log(response.body);
    if (response.body.isNotEmpty) {
      isExist = true;
      return isExist;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> getUsers() async {
    List<Profile> listeProfiles = [];
    String baseUrl = "http://10.0.2.2:4548/Timber/membres";

    var response = await http.get(Uri.parse(baseUrl));
    log(response.body);

    return jsonDecode(response.body);
  }
/*var isExist = false;
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'localhost', port: 3306, user: 'root', db: 'Timber'));

    var result = await conn.query(
        'select nom where login = ? AND password = ?', [login, password]);

    return result.isNotEmpty;*/

  Future<Departement> getDepartementData(var num) async {
    var result = await getCon()
        .query('select num, nom, ville,from users where num = ?', [num]);

    return Departement(num: result[0], nom: result[1], ville: result[2]);
  }

  Future<List<dynamic>> getMembersData() async {
    List<Profile> malist = [];

    var results = await getCon().query(
        'select nom, prenom, description, picture, dept, pictures from membre where id = ?',
        [1]);
    for (var row in results) {
      malist.add(Profile(
        nom: row[0],
        prenom: row[1],
        description: row[2],
        picture: row[3],
        departement: Departement(num: row[4], nom: '', ville: ''),
        pictures: row[5],
      ));
    }
    return malist;
  }
}
