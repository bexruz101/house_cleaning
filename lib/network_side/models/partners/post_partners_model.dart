// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostPartnersModel {
  final String partner_logo;
  final String partner_title;
  final String partner_description;
  PostPartnersModel({
    required this.partner_logo,
    required this.partner_title,
    required this.partner_description,
  });

  PostPartnersModel copyWith({
    String? partner_logo,
    String? partner_title,
    String? partner_description,
  }) {
    return PostPartnersModel(
      partner_logo: partner_logo ?? this.partner_logo,
      partner_title: partner_title ?? this.partner_title,
      partner_description: partner_description ?? this.partner_description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'partner_logo': partner_logo,
      'partner_title': partner_title,
      'partner_description': partner_description,
    };
  }

  factory PostPartnersModel.fromMap(Map<String, dynamic> map) {
    return PostPartnersModel(
      partner_logo: map['partner_logo'] as String,
      partner_title: map['partner_title'] as String,
      partner_description: map['partner_description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostPartnersModel.fromJson(String source) => PostPartnersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostPartnersModel(partner_logo: $partner_logo, partner_title: $partner_title, partner_description: $partner_description)';

  @override
  bool operator ==(covariant PostPartnersModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.partner_logo == partner_logo &&
      other.partner_title == partner_title &&
      other.partner_description == partner_description;
  }

  @override
  int get hashCode => partner_logo.hashCode ^ partner_title.hashCode ^ partner_description.hashCode;
}
