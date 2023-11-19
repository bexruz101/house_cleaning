import 'package:cleaning_house/data/repository/service_repository.dart';
import 'package:cleaning_house/network_side/models/service/post_service_model.dart';
import 'package:cleaning_house/network_side/models/status/form_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../network_side/models/universal_data.dart';
import '../../utils/constants.dart';
part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  final ServiceRepository serviceRepository;

  AddServiceCubit({required this.serviceRepository})
      : super(AddServiceState(
            serviceModel: PostServiceModel(
          catalog_id: "",
          description: '',
          title: '',
        )));

  addService(
      {required PostServiceModel postServiceModel,
      required String adminToken}) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: ""));
    UniversalData response = await serviceRepository.addCService(postServiceModel, adminToken);
    if (response.error.isEmpty) {
      emit(state.copyWith(
          status: FormStatus.success,
          statusText: StatusTextAddCatalog.addService));
    } else {
      state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      );
    }
  }
}
