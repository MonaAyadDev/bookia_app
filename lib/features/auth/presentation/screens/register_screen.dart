import 'package:bookia_app/core/Routes/routes.dart';
import 'package:bookia_app/core/helper/app_dialogs.dart';
import 'package:bookia_app/core/helper/extinsions.dart';
import 'package:bookia_app/core/widgets/app_button.dart';
import 'package:bookia_app/core/widgets/my_arrow_app.dart';
import 'package:bookia_app/core/widgets/my_text_form_field.dart';
import 'package:bookia_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/generated/lib/gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: AppBar(leading: MyArrowBack(), leadingWidth: 85.w),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                AppDialogs.loadingDialog(context);
              } else if (state is AuthSuccess) {
                context.pop();
                context.pushReplacement(Routes.homeScreen);
              } else if (state is AuthError) {
                context.pop();
                AppDialogs.errorDialog(
                  context,
                  message: 'Invalid email or password',
                );
              }
            },
            child: Column(
              children: [
                80.verticalSpace,
                Text(
                  LocaleKeys.auth_hello_register_to_get_started.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 28.sp),
                ),
                45.verticalSpace,
                MyTextFormField(
                  hint: LocaleKeys.auth_username.tr(),
                  controller: cubit.nameController,
                ),
                22.verticalSpace,
                MyTextFormField(
                  hint: LocaleKeys.auth_email.tr(),
                  controller: cubit.emailController,
                ),
                22.verticalSpace,
                MyTextFormField(
                  hint: LocaleKeys.auth_password.tr(),
                  controller: cubit.passwordController,
                ),
                22.verticalSpace,
                MyTextFormField(
                  hint: LocaleKeys.auth_confirm_password.tr(),
                  controller: cubit.passwordConfirmationController,
                ),
                45.verticalSpace,
                AppButton(
                  text: LocaleKeys.auth_register_now.tr(),
                  onPressed: () {
                    cubit.register();
                  },
                ),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
