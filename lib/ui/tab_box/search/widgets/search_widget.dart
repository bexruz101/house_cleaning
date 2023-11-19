import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      elevation: 0,
      stretchTriggerOffset: 200,
      expandedHeight: 110,
      bottom: PreferredSize(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      color: AppColors.passiveWhite,
                    ),
                prefixIcon: Container(
                    margin: EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      AppImages.search,
                    )),
                hintText: 'Qidirish',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.passiveWhite),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColors.passiveWhite),
                ),
              ),
            )),
        preferredSize: Size.fromHeight(120),
      ),
    );
  }
}
