import 'package:cleaning_house/data/repository/auth_repository.dart';
import 'package:cleaning_house/network_side/models/customer/customer_post_model.dart';
import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  final AuthRepository authRepository;

  Future<void> checkLoggedState() async {
    await Future.delayed(Duration(seconds: 3));
    if (authRepository.getToken().isEmpty) {
      emit(AuthUnAuthenticatedState());
    } else {
      emit(AuthLoggedState());
    }
  }

  Future<void> registerUser(
      {required CustomerPostModel customerPostModel}) async {
    emit(AuthLoggedState());
    UniversalData universalData =
        await authRepository.registerUser(customerPostModel: customerPostModel);
    if (universalData.error.isEmpty) {
      debugPrint("TOKEN:${universalData.data}");
      authRepository.setToken(universalData.data as String);
      emit(AuthLoggedState());
    } else {
      emit(AuthErrorState(errorText: universalData.error));
    }
  }

  Future<void> logOut() async {
    emit(AuthLoadingState());
    bool? isDeleted = await authRepository.deleteToken();
    if (isDeleted != null) {
      emit(AuthUnAuthenticatedState());
    }
  }

  updateState() {
    emit(AuthInitial());
  }
}
