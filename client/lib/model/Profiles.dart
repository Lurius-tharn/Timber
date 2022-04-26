import 'Departement.dart';

class Profile {
  final String nom;
  final String prenom;
  final String description;
  final Departement departement;
  final String picture;
  final List<String> pictures;

  Profile(
      {required this.nom,
      required this.prenom,
      required this.description,
      required this.picture,
      required this.departement,
      required this.pictures});
}
