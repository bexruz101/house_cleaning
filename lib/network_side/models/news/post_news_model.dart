// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostNewsModel {
  final String news_title;
  final String news_description;
  final String news_image;
  final String news_video;
  PostNewsModel({
    required this.news_title,
    required this.news_description,
    required this.news_image,
    required this.news_video,
  });

  PostNewsModel copyWith({
    String? news_title,
    String? news_description,
    String? news_image,
    String? news_video,
  }) {
    return PostNewsModel(
      news_title: news_title ?? this.news_title,
      news_description: news_description ?? this.news_description,
      news_image: news_image ?? this.news_image,
      news_video: news_video ?? this.news_video,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'news_title': news_title,
      'news_description': news_description,
      'news_image': news_image,
      'news_video': news_video,
    };
  }

  factory PostNewsModel.fromMap(Map<String, dynamic> map) {
    return PostNewsModel(
      news_title: map['news_title'] as String,
      news_description: map['news_description'] as String,
      news_image: map['news_image'] as String,
      news_video: map['news_video'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostNewsModel.fromJson(String source) => PostNewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostNewsModel(news_title: $news_title, news_description: $news_description, news_image: $news_image, news_video: $news_video)';
  }

  @override
  bool operator ==(covariant PostNewsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.news_title == news_title &&
      other.news_description == news_description &&
      other.news_image == news_image &&
      other.news_video == news_video;
  }

  @override
  int get hashCode {
    return news_title.hashCode ^
      news_description.hashCode ^
      news_image.hashCode ^
      news_video.hashCode;
  }
}
