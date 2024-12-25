class UserModel {
  final String idLibrary;
  final String name;
  final String password;
  final String email;
  final String phone;
  final String level; // 'Admin' or 'Pengunjung'
  final String address;

  UserModel({
    required this.idLibrary,
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.level,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        'idLibrary': idLibrary,
        'name': name,
        'password': password,
        'email': email,
        'phone': phone,
        'level': level,
        'address': address,
      };

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      idLibrary: json['idLibrary'],
      name: json['name'],
      password: json['password'],
      email: json['email'],
      phone: json['phone'],
      level: json['level'],
      address: json['address'],
    );
  }
}
