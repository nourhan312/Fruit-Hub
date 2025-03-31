import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_textstyles.dart';
import 'package:fruit_hub/core/widgets/custom_textbutton.dart';
import 'package:fruit_hub/core/widgets/custom_textformfield.dart';
import 'package:fruit_hub/features/Auth/presentation/widgets/social_button.dart';

import '../../../../core/Routes/app_routes.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextFormField(
            hintText: 'email'.tr(context),
          ),
          CustomTextFormField(
            hintText: 'password'.tr(context),
            suffixIcon: Icon(Icons.remove_red_eye),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.forgetPassword);
            },
            child: Text('forgetPassword'.tr(context),
                style: TextStyles.regular13.copyWith(
                  color: AppColors.lightGreen,
                )),
          ),
          SizedBox(
            height: 33.h,
          ),
          CustomTextButton(onPressed: () {}, data: 'login'.tr(context)),
          SizedBox(
            height: 33.h,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'donHaveAccount'.tr(context),
                style: TextStyles.regular16.copyWith(
                  color: AppColors.lightGrey,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, Routes.signUpRoute);
                      },
                    text: 'doAccount'.tr(context),
                    style: TextStyles.regular16.copyWith(
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 33.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Divider(
                color: AppColors.lightGrey,
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'or'.tr(context),
                  style: TextStyles.regular16.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
              Expanded(
                  child: Divider(
                color: AppColors.lightGrey,
              )),
            ],
          ),
          SizedBox(
            height: 33.h,
          ),
          SocialButton(
              img: AppAssets.googleIcon,
              text: 'SignWithGoogle'.tr(context),
              onPressed: () {}),
          SizedBox(
            height: 16.h,
          ),
          SocialButton(
              img: AppAssets.facebookIcon,
              text: 'SignWithFaceBook'.tr(context),
              onPressed: () {}),
          SizedBox(
            height: 16.h,
          ),
          SocialButton(
              img: AppAssets.appleIcon,
              text: 'SignWithApple'.tr(context),
              onPressed: () {}),
        ],
      ),
    );
  }
}
