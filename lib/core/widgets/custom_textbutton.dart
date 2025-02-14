import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_textstyles.dart';

import '../utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.onPressed, required this.data});
  final VoidCallback onPressed;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.green,
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              data,
              style: TextStyles.bold16.copyWith(
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
