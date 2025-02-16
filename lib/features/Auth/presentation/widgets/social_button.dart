import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_textstyles.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.img, required this.text, required this.onPressed});
final String img;
final String text;
final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextButton(
        onPressed: onPressed,

        style: TextButton.styleFrom(
          backgroundColor: AppColors.fill,
          padding: EdgeInsets.symmetric(
            vertical: 12,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
             side: BorderSide(color: AppColors.borderColor),
          ),
        ),
        child: ListTile(
          visualDensity:  VisualDensity(vertical: VisualDensity.minimumDensity),
          leading:  SvgPicture.asset(img),
          title: Text(text , style: TextStyles.regular16 ,),
        ),
      ),
    );
  }
}
