import 'package:cleaning_house/utils/colors.dart';
import 'package:flutter/material.dart';

class AdsListView extends StatelessWidget {
  const AdsListView({super.key, required this.scrollController, required this.data});

  final ScrollController scrollController;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: ListView.builder(
        controller: scrollController,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            width: 300,
            decoration: BoxDecoration(color: AppColors.C_0FC36D),
            child: Text(data[index]),
          );
          }),
    );
  }
}

