import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../../../../core/widgets/custom_textbutton.dart';
import '../../../../core/widgets/custom_textformfield.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title:  Text(
          'newPassword'.tr(context),
          style: TextStyles.bold19,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 25.h,),
            Text('enterNewPassword'.tr(context),
            style: TextStyles.regular16.copyWith(
              color: AppColors.grey2
            ),

            ),
            SizedBox(height: 30.h,),
            CustomTextFormField(hintText: 'newPassword'.tr(context)),
            SizedBox(height: 15.h,),
            CustomTextFormField(hintText: 'confirmPassword'.tr(context)),
            SizedBox(height: 15.h,),
            CustomTextButton(onPressed: (){}, data: 'NewPassword'.tr(context))
          ],
        ),
      ),
    );
  }
}
