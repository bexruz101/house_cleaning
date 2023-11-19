// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostCategoryModel {
  final String category_name;
  final String service_id;
  PostCategoryModel({
    required this.category_name,
    required this.service_id,
  });

  

  PostCategoryModel copyWith({
    String? category_name,
    String? service_id,
  }) {
    return PostCategoryModel(
      category_name: category_name ?? this.category_name,
      service_id: service_id ?? this.service_id,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'category_name': category_name,
      'service_id': service_id,
    };
  }

  factory PostCategoryModel.fromJson(Map<String, dynamic> map) {
    return PostCategoryModel(
      category_name: map['category_name'] as String,
      service_id: map['service_id'] as String,
    );
  }

  @override
  String toString() => 'PostCategoryModel(category_name: $category_name, service_id: $service_id)';

  @override
  bool operator ==(covariant PostCategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.category_name == category_name &&
      other.service_id == service_id;
  }

  @override
  int get hashCode => category_name.hashCode ^ service_id.hashCode;
}
