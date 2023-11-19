import 'package:cleaning_house/data/repository/news_repository.dart';
import 'package:cleaning_house/network_side/models/news/news_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../network_side/models/universal_data.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({required this.newsRepository}) : super(NewsInitial());

  NewsRepository newsRepository;

  getNews() async {
    emit(NewsLoadingState());
    UniversalData response = await newsRepository.getNews();
   
    if (response.error.isEmpty) {
      emit(NewsSuccessState(newsModel: response.data as List<NewsModel>));
    } else {
      emit(NewsErrorState(errorText: response.error));
    }
  }
}
