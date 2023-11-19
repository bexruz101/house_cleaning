// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_catalog_cubit.dart';

class AddCatalogState extends Equatable {
  final String catalog_name;
  final String statusText;
  final FormStatus status;

  AddCatalogState(
      {required this.catalog_name,
      this.status = FormStatus.pure,
      this.statusText = ""});

  AddCatalogState copyWith({
    String? catalog_name,
    String? statusText,
    FormStatus? status,
  }) {
    return AddCatalogState(
      catalog_name: catalog_name ?? this.catalog_name,
      statusText: statusText ?? this.statusText,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [catalog_name, statusText, status];

  bool canCatalogAdd() {
    if (catalog_name.isEmpty) return false;
    return true;
  }
}
