class AdminTokenModel {
  final String token;
  final String role;
  AdminTokenModel({
    required this.token,
    required this.role,
  });

  AdminTokenModel copyWith({
    String? token,
    String? role,
  }) {
    return AdminTokenModel(
      token: token ?? this.token,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'token': token,
      'role': role,
    };
  }

  factory AdminTokenModel.fromJson(Map<String, dynamic> map) {
    return AdminTokenModel(
      token: map['token'] as String? ?? "null",
      role: map['role'] as String? ?? "null",
    );
  }


  @override
  String toString() => 'AdminTokenModel(token: $token, role: $role)';

  @override
  bool operator ==(covariant AdminTokenModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.token == token &&
      other.role == role;
  }

  @override
  int get hashCode => token.hashCode ^ role.hashCode;
}
