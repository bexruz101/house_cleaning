import 'package:cleaning_house/data/repository/serivce_info_repository.dart';
import 'package:cleaning_house/network_side/models/service_info/service_info_model.dart';
import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'service_info_state.dart';

class ServiceInfoCubit extends Cubit<ServiceInfoState> {
  ServiceInfoRepository serviceInfoRepository;
  ServiceInfoCubit({required this.serviceInfoRepository})
      : super(ServiceInfoInitial());

  getServiceInfo() async {
    emit(ServiceInfoLoadingState());
    UniversalData response = await serviceInfoRepository.getServiceInfo();
    if (response.error.isEmpty) {
      emit(ServiceInfoSuccessState(
          serviceInfoModel: response.data as List<ServiceInfoModel>));
    } else {
      emit(ServiceInfoErrorState(errorText: response.error));
    }
  }
}
