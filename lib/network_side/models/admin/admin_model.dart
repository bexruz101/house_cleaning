
class AdminModel {
  final String email;
  final String password;
  AdminModel({
    required this.email,
    required this.password,
  });
  

  AdminModel copyWith({
    String? email,
    String? password,
  }) {
    return AdminModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson(String gmail, String password) {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory AdminModel.fromJson(Map<String, dynamic> map) {
    return AdminModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
  @override
  String toString() => 'AdminModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant AdminModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
