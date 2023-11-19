import 'package:cleaning_house/bloc/catalog/catalog_event.dart';
import 'package:cleaning_house/bloc/catalog/catalog_state.dart';
import 'package:cleaning_house/data/repository/catalog_repository.dart';
import 'package:cleaning_house/network_side/models/catalog/catalog_model.dart';
import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({required this.catalogRepository})
      : super(CatalogInitialState()) {
    on<GetCatalogs>(_getCatalogs);
  }

  final CatalogRepository catalogRepository;

  Future<void> _getCatalogs(
      GetCatalogs event, Emitter<CatalogState> emit) async {
    emit(CatalogLoadingState());
    UniversalData response = await catalogRepository.getCatalogs();
    if (response.error.isEmpty) {
      emit(CatalogSuccessState(catalogs: response.data as List<CatalogModel>));
    } else {
      emit(CatalogErrorState(errorText: response.error));
    }
  }

}
