class UserModel {
  final String email;
  final String password;

  UserModel({
    required this.email,
    required this.password,
  });

  // Metode untuk mengubah UserModel menjadi format JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  // Metode factory untuk membuat UserModel dari format JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
    );
  }
}
