import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cleaning_house/data/repository/category_repository.dart';
import 'package:cleaning_house/network_side/models/category/category_model.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.categoryRepository}) : super(CategoryInitial());
  CategoryRepository categoryRepository;

  getCategory() async {
    emit(CategoryLoadingState());
    UniversalData response = await categoryRepository.getCategory();
    if (response.error.isEmpty) {
      emit(CategorySuccessState(
          categories: response.data));
    } else {
      emit(CategoryErrorState(errorText: response.error));
    }
  }
}
