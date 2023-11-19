import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w700),
                )),
    );
  }
}
