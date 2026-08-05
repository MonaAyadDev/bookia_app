import 'package:bookia_app/core/Routes/routes.dart';
import 'package:bookia_app/core/widgets/app_button.dart';
import 'package:bookia_app/core/widgets/my_arrow_app.dart';
import 'package:bookia_app/core/widgets/my_text_form_field.dart';
import 'package:bookia_app/generated/lib/gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: MyArrowBack(), leadingWidth: 85.w),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
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
                hint: LocaleKeys.auth_enter_your_email.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              22.verticalSpace,
              MyTextFormField(
                hint: LocaleKeys.auth_enter_your_password.tr(),
                keyboardType: TextInputType.visiblePassword,
                ispass: true,
              ),
              50.verticalSpace,
              AppButton(
                text: LocaleKeys.auth_login_now.tr(),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
