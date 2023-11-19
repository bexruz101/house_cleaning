import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../cubits/catalog/catalog_index.dart';
import '../../../../network_side/models/catalog/catalog_model.dart';
import '../../../../network_side/models/category/category_model.dart';
import '../../../../utils/colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.itemCount, required this.categoryModel});

    final int itemCount;
     final List<CategoryModel> categoryModel;

  @override
  Widget build(BuildContext context) {
     var currentIndex = context.watch<CatalogIndexCubit>().state;
    return SliverToBoxAdapter(
      child: Container(
              height: 50,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: currentIndex == index
                                ? AppColors.C_0FC36D
                                : AppColors.white,
                            border: Border.all(
                              color: currentIndex == index
                                  ? AppColors.C_0FC36D
                                  : AppColors.passiveWhite,
                            )),
                        child: ZoomTapAnimation(
                          onTap: () {
                            context
                                .read<CatalogIndexCubit>()
                                .changeTabIndex(index);
                          },
                          child: Text(categoryModel[index].category_name),
                        ));
                  }),
            ),
    );
  }
}