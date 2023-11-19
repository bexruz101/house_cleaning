class PartenrsModel {
  final String id;
  final String updatedAt;
  final String partner_logo;
  final String partner_title;
  final String partner_description;
  PartenrsModel({
    required this.id,
    required this.updatedAt,
    required this.partner_logo,
    required this.partner_title,
    required this.partner_description,
  });

  PartenrsModel copyWith({
    String? id,
    String? updatedAt,
    String? partner_logo,
    String? partner_title,
    String? partner_description,
  }) {
    return PartenrsModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      partner_logo: partner_logo ?? this.partner_logo,
      partner_title: partner_title ?? this.partner_title,
      partner_description: partner_description ?? this.partner_description,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt,
      'partner_logo': partner_logo,
      'partner_title': partner_title,
      'partner_description': partner_description,
    };
  }

  factory PartenrsModel.fromJson(Map<String, dynamic> map) {
    return PartenrsModel(
      id: map['id'] as String? ?? "null",
      updatedAt: map['updatedAt'] as String? ?? "null",
      partner_logo: map['partner_logo'] as String? ?? "null",
      partner_title: map['partner_title'] as String? ?? "null",
      partner_description: map['partner_description'] as String? ?? "null",
    );
  }


  @override
  String toString() {
    return 'PartenrsModel(id: $id, updatedAt: $updatedAt, partner_logo: $partner_logo, partner_title: $partner_title, partner_description: $partner_description)';
  }

  @override
  bool operator ==(covariant PartenrsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.updatedAt == updatedAt &&
      other.partner_logo == partner_logo &&
      other.partner_title == partner_title &&
      other.partner_description == partner_description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      updatedAt.hashCode ^
      partner_logo.hashCode ^
      partner_title.hashCode ^
      partner_description.hashCode;
  }
}
