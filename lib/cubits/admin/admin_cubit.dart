import 'package:cleaning_house/network_side/models/admin/admin_token_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cleaning_house/data/repository/admin_repository.dart';
import '../../network_side/models/universal_data.dart';
part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminRepository adminRepository;

  AdminCubit({
    required this.adminRepository,
  }) : super(AdminInitial());

  Future<void> checkLoggedState() async {
    await Future.delayed(Duration(seconds: 3));
    if (adminRepository.getAdminToken().isEmpty) {
      emit(AdminUnAuthenticatedState());
    } else {
      emit(AdminLoggedState());
    }
  }

  Future<void> sendCodeToGmailAndLogin(
      {required String gmail, required String password}) async {
    emit(AdminLoadingState());
    UniversalData universalData = await adminRepository
        .loginAdminAndSendCodeToGmail(gmail: gmail, password: password);

    if (universalData.error.isEmpty) {
      emit(AdminConfirmCodeSuccessState());
    } else {
      emit(AdminErrorState(errorText: universalData.error));
    }
  }

  Future<void> verifyCode(int code) async {
    emit(AdminLoadingState());
    UniversalData universalData = await adminRepository.verifyCode(code: code);
    if (universalData.error.isEmpty) {
       AdminTokenModel adminTokenModel = universalData.data;
      adminRepository.setAdminToken(adminTokenModel.token);
      emit(AdminLoggedState());
    } else {
      emit(AdminErrorState(errorText: universalData.error));
    }
  }

  Future<void> logOut() async {
    emit(AdminLoadingState());
    bool? isDeleted = await adminRepository.deleteToken();
    if (isDeleted != null) {
      emit(AdminUnAuthenticatedState());
    }
  }

  updateState() {
    emit(AdminInitial());
  }
}
