import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/custom_textformfield.dart';

class Otp extends StatelessWidget
{
    const Otp({super.key});
    @override
    Widget build(BuildContext context)
    {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                CustomTextFormField(
                    width: 76.w
                ),
                CustomTextFormField(
                    width: 76.w
                ),
                CustomTextFormField(
                    width: 76.w
                ),
                CustomTextFormField(
                    width: 76.w
                )

            ]
        );
    }
}
