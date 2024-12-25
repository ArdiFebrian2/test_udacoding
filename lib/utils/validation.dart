class Validation {
  /// Validasi apakah input kosong
  static String? validateNotEmpty(String value, String fieldName) {
    if (value.isEmpty) {
      return '$fieldName tidak boleh kosong!';
    }
    return null;
  }

  /// Validasi panjang password (minimal 8 karakter)
  static String? validatePassword(String value) {
    if (value.length < 8) {
      return 'Password harus memiliki minimal 8 karakter!';
    }
    return null;
  }

  /// Validasi format email
  static String? validateEmail(String value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Format email tidak valid!';
    }
    return null;
  }

  /// Validasi apakah input berupa angka
  static String? validateNumeric(String value, String fieldName) {
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return '$fieldName hanya boleh berisi angka!';
    }
    return null;
  }
}
