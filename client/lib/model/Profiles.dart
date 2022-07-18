// ignore_for_file: file_names

import 'Departement.dart';

/// Classe Profile representant un model d'un profile'

class Profile {
  final int userId;
  final String nom;
  final String prenom;
  final String description;
  final Departement departement;
  final String picture;
  final List<String> pictures;

  Profile(
      {required this.userId,
      required this.nom,
      required this.prenom,
      required this.description,
      required this.picture,
      required this.departement,
      required this.pictures});
}
