part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection = Firestore.instance
      .collection('users'); //'users nama collection di firestore

  static Future<void> updateUser(User user) async {
    // String genres = ""; //string kosong karena ingin mengubah list genres dari ("genre1","genre2" ke "genre1,genre2")

    // for (var genre in user.selectedGenres) {
    //   genres += genre + ((genre != user.selectedGenres.last) ? ',' : ""); //mengubah list menjadi satu string
    // }

    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenre': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ??
          "", //jika profile picture tidak diisi saat daftar maka akan diisi null
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    return User(id, snapshot.data['email'],
        balance: snapshot.data['balance'],
        profilePicture: snapshot.data['profilePicture'],
        selectedGenres: (snapshot.data['selectedGenre'] as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: snapshot.data['selectedLanguage'],
        name: snapshot.data['name']);
  }
}
