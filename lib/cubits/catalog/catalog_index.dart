import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogIndexCubit extends Cubit<int> {
  CatalogIndexCubit() : super(0);
  void changeTabIndex(int newTabIndex) => emit(newTabIndex);
}