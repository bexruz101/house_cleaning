import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/news/news_cubit.dart';
import '../../../../utils/colors.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
     List colors = [AppColors.C_0FC36D, AppColors.C_FFDCA4, AppColors.C_DE7773];
    return SliverToBoxAdapter(
      child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is NewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsErrorState) {
                return Center(
                  child: Text(state.errorText),
                );
              } else if (state is NewsSuccessState) {
                return CarouselSlider.builder(
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Container(
                      color: colors[index],
                      height: 250,
                      width: double.infinity,
                      child:
                          Center(child: Text(state.newsModel[index].news_title)),
                    );
                  },
                  itemCount: state.newsModel.length,
                  options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      reverse: true,
                      enlargeCenterPage: true),
                );
              }
              return const Text('NOTHING');
            },
          ),
    );
  }
}