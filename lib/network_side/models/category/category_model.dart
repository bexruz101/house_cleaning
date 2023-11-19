import 'package:flutter/foundation.dart';
import 'package:cleaning_house/network_side/models/service_info/service_info_model.dart';

class CategoryModel {
  final String id;
  final String updatedAt;
  final String category_name;
  final List<ServiceInfoModel> service_info;
  CategoryModel({
    required this.id,
    required this.updatedAt,
    required this.category_name,
    required this.service_info,
  });
  

  CategoryModel copyWith({
    String? id,
    String? updatedAt,
    String? category_name,
    List<ServiceInfoModel>? service_info,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      category_name: category_name ?? this.category_name,
      service_info: service_info ?? this.service_info,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt,
      'category_name': category_name,
      'service_info': service_info.map((x) => x.toJson()).toList(),
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String? ?? "",
      updatedAt: map['updatedAt'] as String? ?? "",
      category_name: map['category_name'] as String? ?? "",
      service_info: List<ServiceInfoModel>.from((map['service_info'] as List? ?? [] ).map<ServiceInfoModel>((x) => ServiceInfoModel.fromJson(x as Map<String,dynamic>),),),
    );
  }

 

  @override
  String toString() {
    return 'CategoryModel(id: $id, updatedAt: $updatedAt, category_name: $category_name, service_info: $service_info)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.updatedAt == updatedAt &&
      other.category_name == category_name &&
      listEquals(other.service_info, service_info);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      updatedAt.hashCode ^
      category_name.hashCode ^
      service_info.hashCode;
  }
}
