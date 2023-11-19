import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class PageContent extends StatelessWidget {
  const PageContent(
      {super.key,
      required this.mainImage,
      required this.mainText,
      required this.text});

  final String mainImage;
  final String mainText;
  final String text;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
          ),
          Container(child: Image.asset(mainImage)),
          const Spacer(),
          Text(
            mainText,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          Text(
            text,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
