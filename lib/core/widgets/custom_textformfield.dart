import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/app_textstyles.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
    const CustomTextFormField({super.key,
        this.hintText,
        this.suffixIcon, this.width});

    final String ? hintText;
    final Icon ? suffixIcon;
    final double ? width;

    @override
    Widget build(BuildContext context) {
        return SizedBox(
            height: 65.h,
            width: width ?? double.infinity.sw,
            child: TextFormField(
                style: TextStyles.bold13,

                decoration: InputDecoration(
                    hintText: hintText,

                    suffixIconColor: AppColors.lightGrey,
                    suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 37.w),
                        child: suffixIcon),
                    iconColor: AppColors.textGrey,
                    hintStyle: TextStyles.bold13.copyWith(
                        color: AppColors.lightGrey
                    ),
                    filled: true,
                    fillColor: AppColors.fill,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.white  , width: 1.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.white , width: 1.5)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.white , width: 1.5

                        )
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Colors.red)
                    )
                )
            )
        );
    }
}
