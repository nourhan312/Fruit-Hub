import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_textstyles.dart';
import 'package:fruit_hub/core/widgets/custom_textbutton.dart';
import 'package:fruit_hub/core/widgets/custom_textformfield.dart';
import 'package:fruit_hub/features/Auth/presentation/cubits/sigin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/Auth/presentation/widgets/social_button.dart';

import '../../../../core/Routes/app_routes.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
                style: TextStyles.regular16.copyWith(
                  color: AppColors.white,
                ),
              ),
              backgroundColor: AppColors.green,
            ),
          );
        }
        if (state is SigninSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeName, (route) => false);
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextFormField(
                    hintText: 'email'.tr(context),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email_required'.tr(context);
                      }
                      if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return 'email_invalid'.tr(context);
                      }
                      return null;
                    },
                    controller: _emailController),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password_required'.tr(context);
                    }

                    return null;
                  },
                  hintText: "password".tr(context),
                  controller: _passwordController,
                  obscureText: context.watch<SigninCubit>().isPasswordVisible,
                  suffixIcon: BlocBuilder<SigninCubit, SigninState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          context.read<SigninCubit>().passwordVisibility();
                        },
                        icon: context.read<SigninCubit>().isPasswordVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      );
                    },
                  ),
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
                BlocBuilder<SigninCubit, SigninState>(
                  builder: (context, state) {
                    return CustomTextButton(
                      data: state is SigninLoading ? '' : 'login'.tr(context),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<SigninCubit>()
                              .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                        }
                      },
                      isLoading: state is SigninLoading,
                    );
                  },
                ),
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
                    onPressed: () {
                      context.read<SigninCubit>().signInWithGoogle();
                    }),
                SizedBox(
                  height: 16.h,
                ),
                SocialButton(
                    img: AppAssets.facebookIcon,
                    text: 'SignWithFaceBook'.tr(context),
                    onPressed: () {
                      context.read<SigninCubit>().signInWithFacebook();
                    }),
                SizedBox(
                  height: 16.h,
                ),
                Platform.isIOS
                    ? SocialButton(
                        img: AppAssets.appleIcon,
                        text: 'SignWithApple'.tr(context),
                        onPressed: () {})
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
