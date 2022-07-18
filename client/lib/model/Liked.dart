// ignore_for_file: file_names

import 'package:timber/model/Profiles.dart';

/// Classe Liked representant un model des personnes like par un utilisateur

class Liked {
  final Profile member;
  final Profile liked;

  Liked({required this.member, required this.liked});
}
