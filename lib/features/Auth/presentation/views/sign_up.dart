import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/core/widgets/custom_textbutton.dart';
import 'package:fruit_hub/core/widgets/custom_textformfield.dart';
import 'package:fruit_hub/features/Auth/presentation/widgets/terms_and_conditions.dart';

import '../../../../core/Routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_textstyles.dart';

class SignUp extends StatelessWidget
{
    const SignUp({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    onPressed: ()
                    {
                        Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back_ios)),
                centerTitle: true,
                title: Text(
                    'signUp'.tr(context),
                    style: TextStyles.bold19
                )
            ),
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                        children: [
                            SizedBox(height: 20.h),
                            CustomTextFormField(hintText: "fullName".tr(context)),
                            SizedBox(height: 10.h),
                            CustomTextFormField(hintText: "email".tr(context)),
                            SizedBox(height: 10.h),
                            CustomTextFormField(hintText: "password".tr(context)
                                , suffixIcon: Icon(Icons.remove_red_eye)),

                            TermsAndConditions(),
                            SizedBox(height: 30.h),
                            CustomTextButton(onPressed: ()
                                {
                                }, data: 'createAccount'.tr(context)),
                            SizedBox(height: 30.h),
                            Center(
                                child: RichText(text: TextSpan(
                                        text: 'haveAlreadyAccount'.tr(context),
                                        style: TextStyles.regular16.copyWith(
                                            color: AppColors.lightGrey
                                        ),
                                        children: [
                                            TextSpan(
                                                recognizer: TapGestureRecognizer()..onTap = ()
                                                {
                                                    Navigator.pushNamed(context, Routes.loginName);
                                                },
                                                text: 'login'.tr(context),
                                                style: TextStyles.regular16.copyWith(
                                                    color: AppColors.green
                                                )
                                            )
                                        ]
                                    )
                                )
                            )

                        ]
                    )
                )
            )
        );
    }
}
