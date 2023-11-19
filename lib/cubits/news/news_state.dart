part  of 'news_cubit.dart';



@immutable
abstract class NewsState extends Equatable{}


class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsSuccessState extends NewsState {
  final List<NewsModel> newsModel;

  NewsSuccessState({required this.newsModel});

  @override
  List<Object?> get props => [newsModel];
}

class NewsErrorState extends NewsState {
  final String errorText;

  NewsErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}