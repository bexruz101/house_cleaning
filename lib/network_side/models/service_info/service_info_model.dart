class ServiceInfoModel {
  final String id;
  final String updatedAt;
  final String description;
  final String service_video;
  final String service_image;
  ServiceInfoModel({
    required this.id,
    required this.updatedAt,
    required this.description,
    required this.service_video,
    required this.service_image,
  });
  

  ServiceInfoModel copyWith({
    String? id,
    String? updatedAt,
    String? description,
    String? service_video,
    String? service_image,
  }) {
    return ServiceInfoModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      service_video: service_video ?? this.service_video,
      service_image: service_image ?? this.service_image,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt,
      'description': description,
      'service_video': service_video,
      'service_image': service_image,
    };
  }

  factory ServiceInfoModel.fromJson(Map<String, dynamic> map) {
    return ServiceInfoModel(
      id: map['id'] as String? ?? "null",
      updatedAt: map['updatedAt'] as String? ?? "null",
      description: map['description'] as String? ?? "null",
      service_video: map['service_video'] as String? ?? "null",
      service_image: map['service_image'] as String? ?? "null",
    );
  }

  @override
  String toString() {
    return 'ServiceInfoModel(id: $id, updatedAt: $updatedAt, description: $description, service_video: $service_video, service_image: $service_image)';
  }

  @override
  bool operator ==(covariant ServiceInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.updatedAt == updatedAt &&
      other.description == description &&
      other.service_video == service_video &&
      other.service_image == service_image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      updatedAt.hashCode ^
      description.hashCode ^
      service_video.hashCode ^
      service_image.hashCode;
  }
}
