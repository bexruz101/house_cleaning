// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostServiceModel {
   String title;
   String description;
   String catalog_id;
  PostServiceModel({
    required this.title,
    required this.description,
    required this.catalog_id,
  });
  

  PostServiceModel copyWith({
    String? title,
    String? description,
    String? catalog_id,
  }) {
    return PostServiceModel(
      title: title ?? this.title,
      description: description ?? this.description,
      catalog_id: catalog_id ?? this.catalog_id,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'catalog_id': catalog_id,
    };
  }

  factory PostServiceModel.fromMap(Map<String, dynamic> map) {
    return PostServiceModel(
      title: map['title'] as String,
      description: map['description'] as String,
      catalog_id: map['catalog_id'] as String,
    );
  }

  

  factory PostServiceModel.fromJson(String source) => PostServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostServiceModel(title: $title, description: $description, catalog_id: $catalog_id)';

  @override
  bool operator ==(covariant PostServiceModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description &&
      other.catalog_id == catalog_id;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ catalog_id.hashCode;
}
