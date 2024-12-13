class Staff {
  final int id;
  final String name;
  final String idLibrary;
  final String email;
  final String phone;
  final String level;
  final String address;

  Staff({
    required this.id,
    required this.name,
    required this.idLibrary,
    required this.email,
    required this.phone,
    required this.level,
    required this.address,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['id'],
      name: json['name'],
      idLibrary: json['idLibrary'],
      email: json['email'],
      phone: json['phone'],
      level: json['level'],
      address: json['address'],
    );
  }
}
