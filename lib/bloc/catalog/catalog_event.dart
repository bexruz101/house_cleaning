import 'package:equatable/equatable.dart';

abstract class CatalogEvent extends Equatable {}

class GetCatalogs extends CatalogEvent {
  @override
  List<Object?> get props => [];
}


class GetCatalogById extends CatalogEvent {
  GetCatalogById({required this.catalogId});
  final int catalogId;

  @override
  List<Object?> get props => [catalogId];


}