part of 'service_info_cubit.dart';


@immutable
abstract class ServiceInfoState extends Equatable{}


class ServiceInfoInitial extends ServiceInfoState {
  @override
  List<Object?> get props => [];
}

class ServiceInfoLoadingState extends ServiceInfoState {
  @override
  List<Object?> get props => [];
}

class ServiceInfoSuccessState extends ServiceInfoState {
  final List<ServiceInfoModel> serviceInfoModel;

  ServiceInfoSuccessState({required this.serviceInfoModel});

  @override
  List<Object?> get props => [serviceInfoModel];
}

class ServiceInfoErrorState extends ServiceInfoState {
  final String errorText;

  ServiceInfoErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}