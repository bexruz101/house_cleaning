part of 'account_cubit.dart';

@immutable
abstract class AccountState extends Equatable {}

class AccountInitial extends AccountState {
  @override
  List<Object?> get props => [];
}

class AccountLoadingState extends AccountState {
  @override
  List<Object?> get props => [];
}

class AccountErrorState extends AccountState {
  final String errorText;

  AccountErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}

class AccountSuccessState extends AccountState {
  final CustomerInfo customerInfo;
  AccountSuccessState({required this.customerInfo});

  @override
  List<Object?> get props => [customerInfo];
}
