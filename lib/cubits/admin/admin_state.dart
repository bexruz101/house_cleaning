part of 'admin_cubit.dart';


@immutable
abstract class AdminState extends Equatable {}

class AdminInitial extends AdminState {
  @override
  List<Object?> get props => [];
}

class AdminUnAuthenticatedState extends AdminState {
  @override
  List<Object?> get props => [];
}

class AdminLoadingState extends AdminState {
  @override
  List<Object?> get props => [];
}

class AdminErrorState extends AdminState {
  final String errorText;

  AdminErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}

class AdminSendCodeSuccessState extends AdminState {
  @override
  List<Object?> get props => [];
}

class AdminConfirmCodeSuccessState extends AdminState {
  @override
  List<Object?> get props => [];
}


class AdminLoggedState extends AdminState {
  @override
  List<Object?> get props => [];
}