import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/app_colors.dart';
import '../utils/app_textstyles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.data,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,
  });

  final String data;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: isLoading
            ? LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.white,
                size: 24,
              )
            : Text(
                data,
                style: TextStyles.bold16.copyWith(
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}
