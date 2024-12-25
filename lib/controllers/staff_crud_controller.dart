import 'package:flutter/material.dart';
import '../utils/local_storage.dart';

class StaffCrudController {
  List<Map<String, dynamic>> staffList = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String selectedLevel = 'Admin';

  Future<void> loadStaffData() async {
    final users = await LocalStorage.getUsers();
    staffList = users;
  }

  Future<void> saveStaff() async {
    final newStaff = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'name': nameController.text,
      'idLibrary': idController.text,
      'password': passwordController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'level': selectedLevel,
      'address': addressController.text,
    };

    staffList.add(newStaff);
    await LocalStorage.saveUsers(staffList);
  }

  Future<void> editStaff(Map<String, dynamic> staff) async {
    nameController.text = staff['name'];
    idController.text = staff['idLibrary'];
    passwordController.text = staff['password'];
    emailController.text = staff['email'];
    phoneController.text = staff['phone'];
    addressController.text = staff['address'];
    selectedLevel = staff['level'];
  }

  Future<void> updateStaff(Map<String, dynamic> staff) async {
    final updatedStaff = {
      'id': staff['id'],
      'name': nameController.text,
      'idLibrary': idController.text,
      'password': passwordController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'level': selectedLevel,
      'address': addressController.text,
    };

    final index = staffList.indexWhere((s) => s['id'] == staff['id']);
    staffList[index] = updatedStaff;
    await LocalStorage.saveUsers(staffList);
  }

  Future<void> deleteStaff(String id) async {
    staffList.removeWhere((s) => s['id'] == id);
    await LocalStorage.saveUsers(staffList);
  }

  void clearFields() {
    nameController.clear();
    idController.clear();
    passwordController.clear();
    emailController.clear();
    phoneController.clear();
    addressController.clear();
    selectedLevel = 'Admin';
  }
}
