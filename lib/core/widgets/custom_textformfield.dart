import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/app_textstyles.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.width,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onTap,
  });

  final String? hintText;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final double? width;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      width: width ?? double.infinity.sw,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyles.bold13,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIconColor: AppColors.lightGrey,
          suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.w),
              child: suffixIcon),
          iconColor: AppColors.textGrey,
          hintStyle: TextStyles.bold13.copyWith(
            color: AppColors.lightGrey,
          ),
          errorMaxLines: 2,
          filled: true,
          fillColor: AppColors.fill,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppColors.white, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppColors.white, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppColors.white, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorStyle: const TextStyle(color: Colors.red),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 20.h,
          ),
        ),
      ),
    );
  }
}
