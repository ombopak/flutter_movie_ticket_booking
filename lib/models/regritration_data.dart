part of 'models.dart';

class RegistrationData {
  String password;
  String email;
  String name;
  File profileImage;
  List<String> selectedGenres;
  String selectedLang;

  RegistrationData({
    this.email = "",
    this.name = "",
    this.password = "",
    this.selectedGenres = const [],
    this.selectedLang = "",
    this.profileImage,

  });
}

