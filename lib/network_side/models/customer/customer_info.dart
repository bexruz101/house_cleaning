// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CustomerInfo {
  final String id;
  final String updatedAt;
  final String name;
  final String phone_number;
  final List orders;
  CustomerInfo({
    required this.id,
    required this.updatedAt,
    required this.name,
    required this.phone_number,
    required this.orders,
  });
  


  CustomerInfo copyWith({
    String? id,
    String? updatedAt,
    String? name,
    String? phone_number,
    List? orders,
  }) {
    return CustomerInfo(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      phone_number: phone_number ?? this.phone_number,
      orders: orders ?? this.orders,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt,
      'name': name,
      'phone_number': phone_number,
      'orders': orders,
    };
  }

  factory CustomerInfo.fromJson(Map<String, dynamic> map) {
    return CustomerInfo(
      id: map['id'] as String? ?? "null",
      updatedAt: map['updatedAt'] as String? ?? "null",
      name: map['name'] as String? ?? "null",
      phone_number: map['phone_number'] as String? ?? "null",
      orders: List.from((map['orders'] as List? ?? []),
    ));
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CustomerInfo(id: $id, updatedAt: $updatedAt, name: $name, phone_number: $phone_number, orders: $orders)';
  }

  @override
  bool operator ==(covariant CustomerInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.updatedAt == updatedAt &&
      other.name == name &&
      other.phone_number == phone_number &&
      listEquals(other.orders, orders);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      updatedAt.hashCode ^
      name.hashCode ^
      phone_number.hashCode ^
      orders.hashCode;
  }
}
