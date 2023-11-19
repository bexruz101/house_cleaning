import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../utils/colors.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        height:50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF4F8962),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),);
  }
}
