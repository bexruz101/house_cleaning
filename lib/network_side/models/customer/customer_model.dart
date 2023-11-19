// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class CustomerModel {
  final String id;
  final String updatedAt;
  final String name;
  final String phone_number;
  CustomerModel({
    required this.id,
    required this.updatedAt,
    required this.name,
    required this.phone_number,
  });
 

  CustomerModel copyWith({
    String? id,
    String? updatedAt,
    String? name,
    String? phone_number,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      phone_number: phone_number ?? this.phone_number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt,
      'name': name,
      'phone_number': phone_number,
    };
  }

  factory CustomerModel.fromJson(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] as String? ?? "null",
      updatedAt: map['updatedAt'] as String? ?? "null",
      name: map['name'] as String? ?? "null",
      phone_number: map['phone_number'] as String? ?? "null",
    );
  }

  String toJson() => json.encode(toMap());


  @override
  String toString() {
    return 'CustomerModel(id: $id, updatedAt: $updatedAt, name: $name, phone_number: $phone_number)';
  }

  @override
  bool operator ==(covariant CustomerModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.updatedAt == updatedAt &&
      other.name == name &&
      other.phone_number == phone_number;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      updatedAt.hashCode ^
      name.hashCode ^
      phone_number.hashCode;
  }
}
