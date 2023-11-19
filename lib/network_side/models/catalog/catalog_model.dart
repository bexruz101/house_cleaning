// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cleaning_house/network_side/models/service/service_model.dart';

class CatalogModel {
  final String id;
  final String updatedAt;
  final String catalog_name;
  final List<ServiceModel> service;
  CatalogModel({
    required this.id,
    required this.updatedAt,
    required this.catalog_name,
    required this.service,
  });
 

  CatalogModel copyWith({
    String? id,
    String? updatedAt,
    String? catalog_name,
    List<ServiceModel>? service,
  }) {
    return CatalogModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      catalog_name: catalog_name ?? this.catalog_name,
      service: service ?? this.service,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt,
      'catalog_name': catalog_name,
      'service': service.map((x) => x.toMap()).toList(),
    };
  }

  factory CatalogModel.fromJson(Map<String, dynamic> map) {
    return CatalogModel(
      id: map['id'] as String? ?? "null",
      updatedAt: map['updatedAt'] as String? ?? "null",
      catalog_name: map['catalog_name'] as String? ?? "null",
      service: List<ServiceModel>.from((map['service'] as List? ?? []).map<ServiceModel>((x) => ServiceModel.fromJson(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());



  @override
  String toString() {
    return 'CatalogModel(id: $id, updatedAt: $updatedAt, catalog_name: $catalog_name, service: $service)';
  }

  @override
  bool operator ==(covariant CatalogModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.updatedAt == updatedAt &&
      other.catalog_name == catalog_name &&
      listEquals(other.service, service);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      updatedAt.hashCode ^
      catalog_name.hashCode ^
      service.hashCode;
  }
}
