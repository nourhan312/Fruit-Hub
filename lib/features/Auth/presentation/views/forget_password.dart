import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_textstyles.dart';
import 'package:fruit_hub/core/widgets/custom_textbutton.dart';
import 'package:fruit_hub/core/widgets/custom_textformfield.dart';

class ForgetPassword extends StatelessWidget {
    const ForgetPassword({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                        Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back_ios)),
                centerTitle: true,
                title: Text(
                    'forgetPassTitle'.tr(context),
                    style: TextStyles.bold19
                )
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    children: [
                        SizedBox(height: 25.h),
                        Text('dontWorry'.tr(context),
                            style: TextStyles.regular16.copyWith(
                                color: AppColors.grey2
                            )

                        ),
                        SizedBox(height: 30.h),
                        CustomTextFormField(hintText: 'phone'.tr(context)),
                        SizedBox(height: 30.h),
                        CustomTextButton(onPressed: (){}, data: 'forgotPassword'.tr(context))
                    ]
                )
            )

        );
    }
}
