// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostServiceInfoModel {
  final String description;
  final String service_video;
  final String service_image;
  final String service_id;
  final String category_id;
  PostServiceInfoModel({
    required this.description,
    required this.service_video,
    required this.service_image,
    required this.service_id,
    required this.category_id,
  });

  PostServiceInfoModel copyWith({
    String? description,
    String? service_video,
    String? service_image,
    String? service_id,
    String? category_id,
  }) {
    return PostServiceInfoModel(
      description: description ?? this.description,
      service_video: service_video ?? this.service_video,
      service_image: service_image ?? this.service_image,
      service_id: service_id ?? this.service_id,
      category_id: category_id ?? this.category_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'service_video': service_video,
      'service_image': service_image,
      'service_id': service_id,
      'category_id': category_id,
    };
  }

  factory PostServiceInfoModel.fromMap(Map<String, dynamic> map) {
    return PostServiceInfoModel(
      description: map['description'] as String,
      service_video: map['service_video'] as String,
      service_image: map['service_image'] as String,
      service_id: map['service_id'] as String,
      category_id: map['category_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostServiceInfoModel.fromJson(String source) => PostServiceInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostServiceInfoModel(description: $description, service_video: $service_video, service_image: $service_image, service_id: $service_id, category_id: $category_id)';
  }

  @override
  bool operator ==(covariant PostServiceInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.description == description &&
      other.service_video == service_video &&
      other.service_image == service_image &&
      other.service_id == service_id &&
      other.category_id == category_id;
  }

  @override
  int get hashCode {
    return description.hashCode ^
      service_video.hashCode ^
      service_image.hashCode ^
      service_id.hashCode ^
      category_id.hashCode;
  }
}
