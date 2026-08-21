import 'package:bookia_app/core/constants/images_app.dart';
import 'package:bookia_app/core/widgets/app_button.dart';
import 'package:bookia_app/generated/lib/gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              AppImages.passChenged,
              width: 100.w,
              height: 100.h,
            ),
            32.verticalSpace,
            Text(
              LocaleKeys.auth_password_changed.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: 27.sp),
            ),

            12.verticalSpace,
            Text(
              LocaleKeys.auth_password_changed_sub.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 15.sp),
            ),
            40.verticalSpace,
            AppButton(
              text: LocaleKeys.auth_back_to_login.tr(),
              fontSize: 16.sp,
              onPressed: () {},
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
