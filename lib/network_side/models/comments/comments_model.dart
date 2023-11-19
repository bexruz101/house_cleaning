// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cleaning_house/network_side/models/customer/customer_model.dart';

class CommentsModel {
  final String id;
  final String updatedAt;
  final String comment;
  final int rating;
  final CustomerModel customer;
  CommentsModel({
    required this.id,
    required this.updatedAt,
    required this.comment,
    required this.rating,
    required this.customer,
  });
 

  CommentsModel copyWith({
    String? id,
    String? updatedAt,
    String? comment,
    int? rating,
    CustomerModel? customer,
  }) {
    return CommentsModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      customer: customer ?? this.customer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt,
      'comment': comment,
      'rating': rating,
      'customer': customer.toMap(),
    };
  }

  factory CommentsModel.fromJson(Map<String, dynamic> map) {
    return CommentsModel(
      id: map['id'] as String? ?? "null",
      updatedAt: map['updatedAt'] as String? ?? "null",
      comment: map['comment'] as String? ?? "null",
      rating: map['rating'] as int? ?? 0,
      customer: CustomerModel.fromJson(map['customer'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());


  @override
  String toString() {
    return 'CommentsModel(id: $id, updatedAt: $updatedAt, comment: $comment, rating: $rating, customer: $customer)';
  }

  @override
  bool operator ==(covariant CommentsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.updatedAt == updatedAt &&
      other.comment == comment &&
      other.rating == rating &&
      other.customer == customer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      updatedAt.hashCode ^
      comment.hashCode ^
      rating.hashCode ^
      customer.hashCode;
  }
}
