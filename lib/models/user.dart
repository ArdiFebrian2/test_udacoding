class User {
  final String name;
  final String idLibrary;
  final String email;

  User({required this.name, required this.idLibrary, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      idLibrary: json['idLibrary'],
      email: json['email'],
    );
  }
}
