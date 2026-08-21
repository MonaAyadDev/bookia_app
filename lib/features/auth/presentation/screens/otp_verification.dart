import 'package:bookia_app/core/Routes/routes.dart';
import 'package:bookia_app/core/constants/app_color.dart';
import 'package:bookia_app/core/helper/app_dialogs.dart';
import 'package:bookia_app/core/helper/extinsions.dart';
import 'package:bookia_app/core/widgets/app_button.dart';
import 'package:bookia_app/core/widgets/my_arrow_app.dart';
import 'package:bookia_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/generated/lib/gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(leading: MyArrowBack(), leadingWidth: 85.w),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              AppDialogs.loadingDialog(context);
            } else if (state is AuthSuccess) {
              context.pop();
              context.pushToBase(Routes.otpForgetPasswordScreen);
            } else if (state is AuthError) {
              context.pop();
              AppDialogs.errorDialog(
                context,
                message: 'Invalid email or password',
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                80.verticalSpace,
                Text(
                  LocaleKeys.auth_otp_verification.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 28.sp),
                ),
                45.verticalSpace,

                Text(
                  LocaleKeys.auth_otp_sub.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 15.sp),
                ),
                45.verticalSpace,
                Center(
                  child: Pinput(
                    length: 6,
                    showCursor: true,
                    controller: cubit.verifyCodeController,
                    defaultPinTheme: PinTheme(
                      width: 48.w,
                      height: 56.h,

                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F8F9),
                        borderRadius: BorderRadius.circular(8),

                        border: Border.all(color: AppColors.darkTextBody),
                      ),
                    ),

                    onCompleted: (pin) {
                      // الكود المكتمل
                      print('Completed PIN: $pin');
                    },
                  ),
                ),

                50.verticalSpace,
                AppButton(
                  text: LocaleKeys.auth_verify.tr(),
                  onPressed: () {
                    cubit.forgotPassword();
                  },
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.auth_didnt_receive_code.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        // إعادة إرسال الكود
                      },
                      child: Text(
                        LocaleKeys.auth_resend.tr(),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
