import 'package:cleaning_house/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      required this.textInputAction,
      required this.onChanged,
      required this.inputFormatter, required this.controller});

  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final ValueChanged<String> onChanged;
  final List<TextInputFormatter> inputFormatter;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        inputFormatters: inputFormatter,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.titleMedium,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColors.white),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
