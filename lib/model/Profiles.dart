class Profile {
  final String nom;
  final String prenom;
  final String description;
  final String departement;
  final String picture;
  final List<String> pictures;
  bool liked;

  Profile({required this.nom,
    required this.prenom,
    required this.description,
    required this.picture,
    required this.departement,
    required this.liked,
    required this.pictures});
}
