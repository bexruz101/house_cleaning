import 'package:cleaning_house/data/repository/catalog_repository.dart';
import 'package:cleaning_house/network_side/models/status/form_status.dart';
import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:cleaning_house/utils/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_catalog_state.dart';

class AddCatalogCubit extends Cubit<AddCatalogState> {
  final CatalogRepository catalogRepository;

  AddCatalogCubit({required this.catalogRepository})
      : super(AddCatalogState(catalog_name: ""));

  addCatalog({required String catalogName,required String adminToken}) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: ""));
    UniversalData response =
        await catalogRepository.addCatalog(catalogName, adminToken);
    if (response.error.isEmpty) {
      emit(state.copyWith(
          status: FormStatus.success,
          statusText: StatusTextAddCatalog.addCatalog));
    } else {
      state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      );
    }
  }

  
}
