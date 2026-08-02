import 'package:bookia_app/core/widgets/app_button.dart';
import 'package:bookia_app/core/widgets/my_arrow_app.dart';
import 'package:bookia_app/core/widgets/my_text_form_field.dart';
import 'package:bookia_app/generated/lib/gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: MyArrowBack(), leadingWidth: 85.w),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Text(
              LocaleKeys.auth_hello_register_to_get_started.tr(),
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontSize: 28.sp),
            ),
            SizedBox(height: 45.h),
            MyTextFormField(hint: LocaleKeys.auth_username.tr()),
            SizedBox(height: 22.h),
            MyTextFormField(hint: LocaleKeys.auth_email.tr()),
            SizedBox(height: 22.h),
            MyTextFormField(hint: LocaleKeys.auth_password.tr()),
            SizedBox(height: 22.h),
            MyTextFormField(hint: LocaleKeys.auth_confirm_password.tr()),
            SizedBox(height: 45.h),
            AppButton(
              text: LocaleKeys.auth_register_now.tr(),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   // MaterialPageRoute(builder: (context) => LoginScreen()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
