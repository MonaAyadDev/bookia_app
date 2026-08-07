import 'package:bookia_app/core/Routes/routes.dart';
import 'package:bookia_app/core/helper/app_dialogs.dart';
import 'package:bookia_app/core/helper/extinsions.dart';
import 'package:bookia_app/core/widgets/app_button.dart';
import 'package:bookia_app/core/widgets/my_arrow_app.dart';
import 'package:bookia_app/core/widgets/my_text_form_field.dart';
import 'package:bookia_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:bookia_app/generated/lib/gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: MyArrowBack(), leadingWidth: 85.w),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                AppDialogs.loadingDialog(context);
              } else if (state is LoginSuccess) {
                context.pop();
                context.pushReplacement(Routes.homeScreen);
              } else if (state is LoginError) {
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
                  LocaleKeys.auth_welcome_back.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 28.sp),
                ),
                45.verticalSpace,
                MyTextFormField(
                  controller: emailController,
                  hint: LocaleKeys.auth_enter_your_email.tr(),
                  keyboardType: TextInputType.emailAddress,
                ),
                22.verticalSpace,
                MyTextFormField(
                  controller: passwordController,
                  hint: LocaleKeys.auth_enter_your_password.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  ispass: true,
                ),
                50.verticalSpace,
                AppButton(
                  text: LocaleKeys.auth_login_now.tr(),
                  onPressed: () {
                    context.read<LoginCubit>().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
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
