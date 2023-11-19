// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_service_cubit.dart';

class AddServiceState extends Equatable {
  final PostServiceModel serviceModel;
  final String statusText;
  final FormStatus status;

  AddServiceState({
    required this.serviceModel,
     this.statusText = "",
     this.status = FormStatus.pure,
  });

 

  @override
  List<Object?> get props => [serviceModel, statusText, status];



  AddServiceState copyWith({
    PostServiceModel? serviceModel,
    String? statusText,
    FormStatus? status,
  }) {
    return AddServiceState(
      serviceModel: serviceModel ?? this.serviceModel,
      statusText: statusText ?? this.statusText,
      status: status ?? this.status,
    );
  }
}
