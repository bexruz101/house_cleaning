part of 'user_data_cubit.dart';

class UserDataState {
  final String errorText;
  final CustomerModel customerModel;
  UserDataState({
    required this.errorText,
    required this.customerModel,
  });


  UserDataState copyWith({
    String? errorText,
    CustomerModel? customerModel,
  }) {
    return UserDataState(
      errorText: errorText ?? this.errorText,
      customerModel: customerModel ?? this.customerModel,
    );
  }
}
