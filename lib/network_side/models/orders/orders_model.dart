// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderModel {
  final String orderId;
  final String address;
  final String comment;
  final String status;
  OrderModel({
    required this.orderId,
    required this.address,
    required this.comment,
    required this.status,
  });

  OrderModel copyWith({
    String? orderId,
    String? address,
    String? comment,
    String? status,
  }) {
    return OrderModel(
      orderId: orderId ?? this.orderId,
      address: address ?? this.address,
      comment: comment ?? this.comment,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'address': address,
      'comment': comment,
      'status': status,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'] as String,
      address: map['address'] as String,
      comment: map['comment'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(orderId: $orderId, address: $address, comment: $comment, status: $status)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.orderId == orderId &&
      other.address == address &&
      other.comment == comment &&
      other.status == status;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
      address.hashCode ^
      comment.hashCode ^
      status.hashCode;
  }
}
