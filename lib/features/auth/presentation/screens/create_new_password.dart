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

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: AppBar(leading: MyArrowBack(), leadingWidth: 85.w),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                AppDialogs.loadingDialog(context);
              } else if (state is AuthSuccess) {
                context.pop();
                context.pushToBase(Routes.passwordChengedScreen);
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
                  LocaleKeys.auth_create_new_password.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 28.sp),
                ),
                45.verticalSpace,

                Text(
                  LocaleKeys.auth_create_password_sub.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 28.sp),
                ),
                45.verticalSpace,
                MyTextFormField(
                  hint: LocaleKeys.auth_new_password.tr(),
                  keyboardType: TextInputType.emailAddress,
                  controller: cubit.newPassController,
                ),
                45.verticalSpace,
                MyTextFormField(
                  hint: LocaleKeys.auth_confirm_password.tr(),
                  keyboardType: TextInputType.emailAddress,
                  controller: cubit.passwordConfirmationController,
                ),
                50.verticalSpace,
                AppButton(
                  text: LocaleKeys.auth_reset_password.tr(),
                  onPressed: () {
                    cubit.createPassword();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
