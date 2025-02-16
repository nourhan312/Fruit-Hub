import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/features/Auth/presentation/widgets/otp.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../../../../core/widgets/custom_textbutton.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

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
          'checkCode'.tr(context),
          style: TextStyles.bold19,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 25.h,),
            Text('enterPhone'.tr(context),
            style: TextStyles.regular16.copyWith(
              color: AppColors.grey2
            ),

            ),
            SizedBox(height: 30.h,),
            //
            Otp(),
            SizedBox(height: 20.h,),
            CustomTextButton(onPressed: (){}, data: 'checkCode'.tr(context)),
             SizedBox(height: 20.h,),
            TextButton(onPressed: (){}, child: Text('resendCode'.tr(context) ,

            style: TextStyles.regular16.copyWith(
              color: AppColors.green
            ),))
          ],
        ),
      ),
    );
  }
}
