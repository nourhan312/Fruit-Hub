import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/core/widgets/custom_textbutton.dart';
import 'package:fruit_hub/core/widgets/custom_textformfield.dart';
import 'package:fruit_hub/features/Auth/presentation/widgets/terms_and_conditions.dart';

import '../../../../core/Routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../cubits/signup-cubit/signup_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool isChecked = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
                style: TextStyles.regular16.copyWith(
                  color: AppColors.white,
                ),
              ),
              backgroundColor: AppColors.green,
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                CustomTextFormField(
                    hintText: "fullName".tr(context),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'name_required'.tr(context);
                      }
                      if (value.length < 3) {
                        return 'name_min_length'.tr(context);
                      }
                      return null;
                    },
                    controller: _fullNameController),
                SizedBox(height: 10.h),
                CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email_required'.tr(context);
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'email_invalid'.tr(context);
                      }
                      return null;
                    },
                    hintText: "email".tr(context),
                    controller: _emailController),
                SizedBox(height: 10.h),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password_required'.tr(context);
                    }
                    if (value.length < 6) {
                      return 'password_min_length'.tr(context);
                    }
                    return null;
                  },
                  hintText: ("password").tr(context),
                  controller: _passwordController,
                  obscureText: context.watch<SignupCubit>().isPasswordVisible,
                  suffixIcon: BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          context.read<SignupCubit>().passwordVisibility();
                        },
                        icon: context.read<SignupCubit>().isPasswordVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      );
                    },
                  ),
                ),
                TermsAndConditions(
                  onChanged: (value) {
                    isChecked = value;
                  },
                ),
                SizedBox(height: 30.h),
                BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                  return CustomTextButton(
                    isLoading: state is SignupLoading,
                    data: state is SignupLoading ? '' : 'signUp'.tr(context),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (!isChecked) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'validation.terms_required'.tr(context),
                                style: TextStyles.regular16
                                    .copyWith(color: AppColors.white),
                              ),
                              backgroundColor: AppColors.green,
                            ),
                          );
                        } else {
                          context
                              .read<SignupCubit>()
                              .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                                name: _fullNameController.text,
                              );
                        }
                      }
                    },
                  );
                }),
                SizedBox(height: 30.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'haveAlreadyAccount'.tr(context),
                      style: TextStyles.regular16
                          .copyWith(color: AppColors.lightGrey),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, Routes.loginName);
                              },
                            text: 'login'.tr(context),
                            style: TextStyles.regular16
                                .copyWith(color: AppColors.green))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
