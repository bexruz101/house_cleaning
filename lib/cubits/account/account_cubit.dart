import 'package:cleaning_house/data/repository/account_repository.dart';
import 'package:cleaning_house/network_side/models/customer/customer_info.dart';
import 'package:cleaning_house/network_side/models/customer/customer_post_model.dart';
import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit({required this.accountRepository}) : super(AccountInitial());

  final AccountRepository accountRepository;

  getUserData({required String userToken}) async {
    emit(AccountLoadingState());
    UniversalData response =
        await accountRepository.getCustomerDataById(userToken: userToken);
    if (response.error.isEmpty) {
      emit(AccountSuccessState(customerInfo: response.data as CustomerInfo));
    } else {
      emit(AccountErrorState(errorText: response.error));
    }
  }

  updateUserData({required String userToken,required CustomerPostModel customerPostModel}) async {
    emit(AccountLoadingState());
    UniversalData response = await accountRepository.updateUserData(
        userToken: userToken, customerPostModel: customerPostModel);
    UniversalData response2 = await accountRepository.getCustomerDataById(
        userToken: userToken);
    if(response.error.isEmpty){
        emit(AccountSuccessState(customerInfo: response2.data as CustomerInfo));   
    }else {
      emit(AccountErrorState(errorText: response.error));
    }
  }
  
}
