part of 'category_cubit.dart';


@immutable
abstract class CategoryState extends Equatable{}

class CategoryInitial extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategorySuccessState extends CategoryState {
  final List<CategoryModel> categories;

  CategorySuccessState({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class CategoryErrorState extends CategoryState {
  final String errorText;

  CategoryErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}