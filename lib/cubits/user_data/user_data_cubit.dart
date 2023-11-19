import 'package:cleaning_house/network_side/models/customer/customer_field_key.dart';
import 'package:cleaning_house/network_side/models/customer/customer_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit()
      : super(UserDataState(
            errorText: "",
            customerModel: CustomerModel(
                id: "", updatedAt: "", name: "", phone_number: "")));

  updateCustomerField({
    required CustomerFielKeys fieldKey,
    required dynamic value,
  }) {
    CustomerModel currentCustomer = state.customerModel;

    switch (fieldKey) {
      case CustomerFielKeys.name:
        {
          currentCustomer = currentCustomer.copyWith(name: value as String);
          break;
        }
      case CustomerFielKeys.phoneNumber:
        {
          currentCustomer =
              currentCustomer.copyWith(phone_number: value as String);
          break;
        }
    }
    emit(state.copyWith(customerModel: currentCustomer));
  }

  bool canRegister() {
    CustomerModel currentCustomer = state.customerModel;
    if (currentCustomer.name.isEmpty) {
      return false;
    }
    if (currentCustomer.phone_number.length != 19) {
      return false;
    }
    return true;
  }

  clearData() {
    emit(UserDataState(
        errorText: "",
        customerModel:
            CustomerModel(id: "", updatedAt: "", name: "", phone_number: "")));
  }
}
