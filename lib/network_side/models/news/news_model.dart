import 'dart:convert';

class NewsModel {
  final String id;
  final String updatedAt;
  final String news_title;
  final String news_description;
  final String news_image;
  final String news_video;
  NewsModel({
    required this.id,
    required this.updatedAt,
    required this.news_title,
    required this.news_description,
    required this.news_image,
    required this.news_video,
  });
 

  NewsModel copyWith({
    String? id,
    String? updatedAt,
    String? news_title,
    String? news_description,
    String? news_image,
    String? news_video,
  }) {
    return NewsModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      news_title: news_title ?? this.news_title,
      news_description: news_description ?? this.news_description,
      news_image: news_image ?? this.news_image,
      news_video: news_video ?? this.news_video,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt,
      'news_title': news_title,
      'news_description': news_description,
      'news_image': news_image,
      'news_video': news_video,
    };
  }

  factory NewsModel.fromJson(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'] as String? ?? "null",
      updatedAt: map['updatedAt'] as String? ?? "null",
      news_title: map['news_title'] as String? ?? "null",
      news_description: map['news_description'] as String? ?? "null",
      news_image: map['news_image'] as String? ?? "null",
      news_video: map['news_video'] as String? ?? "null",
    );
  }

  String toJson() => json.encode(toMap());

 

  @override
  String toString() {
    return 'NewsModel(id: $id, updatedAt: $updatedAt, news_title: $news_title, news_description: $news_description, news_image: $news_image, news_video: $news_video)';
  }

  @override
  bool operator ==(covariant NewsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.updatedAt == updatedAt &&
      other.news_title == news_title &&
      other.news_description == news_description &&
      other.news_image == news_image &&
      other.news_video == news_video;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      updatedAt.hashCode ^
      news_title.hashCode ^
      news_description.hashCode ^
      news_image.hashCode ^
      news_video.hashCode;
  }
}
