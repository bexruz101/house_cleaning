// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ServiceModel {
  final String id;
  final String updatedAt;
  final String title;
  final String description;
  ServiceModel({
    required this.id,
    required this.updatedAt,
    required this.title,
    required this.description,
  });
 
 

  ServiceModel copyWith({
    String? id,
    String? updatedAt,
    String? title,
    String? description,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt,
      'title': title,
      'description': description,
    };
  }

  factory ServiceModel.fromJson(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] as String? ?? "",
      updatedAt: map['updatedAt'] as String? ?? "",
      title: map['title'] as String? ?? "",
      description: map['description'] as String? ?? "",
    );
  }

  String toJson() => json.encode(toMap());

 

  @override
  String toString() {
    return 'ServiceModel(id: $id, updatedAt: $updatedAt, title: $title, description: $description)';
  }

  @override
  bool operator ==(covariant ServiceModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.updatedAt == updatedAt &&
      other.title == title &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      updatedAt.hashCode ^
      title.hashCode ^
      description.hashCode;
  }
}
