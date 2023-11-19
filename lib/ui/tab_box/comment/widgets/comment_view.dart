import 'package:cleaning_house/network_side/models/comments/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

class CommenView extends StatelessWidget {
  CommenView({
    required this.commentModel,
  });

  final List<CommentsModel> commentModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: List.generate(
            commentModel.length,
            (index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.C_ECEFD4,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    trailing: Text(
                      commentModel[index].rating.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppColors.passiveWhite),
                    ),
                    title: Text(commentModel[index].customer.name),
                    subtitle: Text(commentModel[index].comment),
                    leading: Container(
                      height: 38,
                      width: 38,
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.C_E9FEF4,
                      ),
                      child: SvgPicture.asset(AppImages.ggmail),
                    ),
                  ),
                )),),
    );
  }
}
