import 'package:equatable/equatable.dart';
import '../../network_side/models/catalog/catalog_model.dart';

abstract class CatalogState extends Equatable {}
class CatalogInitialState extends CatalogState {
  
  @override
  List<Object?> get props => [];
}

class CatalogLoadingState extends CatalogState {
  @override
  List<Object?> get props => [];
}

class CatalogSuccessState extends CatalogState {
  CatalogSuccessState({required this.catalogs});

  final List<CatalogModel> catalogs;

  @override
  List<Object?> get props => [catalogs];
}

class CatalogErrorState extends CatalogState {
   final String errorText;
   
  CatalogErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];


}