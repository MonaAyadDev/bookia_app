import 'package:bookia_app/core/constants/images_app.dart';
import 'package:bookia_app/core/theme/cubit/theme_cubit.dart';
import 'package:bookia_app/core/widgets/app_button.dart';
import 'package:bookia_app/features/auth/presentation/screens/login_screen.dart';
import 'package:bookia_app/features/start/presentation/widgets/coutom_flutter_toggle_tap.dart';
import 'package:bookia_app/generated/lib/gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.welcome),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              SizedBox(height: 120.h),
              SvgPicture.asset(AppImages.logoSvg, height: 100.h),
              SizedBox(height: 15.h),
              Text(
                LocaleKeys.welcome_order_your_book_now.tr(),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontSize: 28),
              ),
              SizedBox(height: 100.h),
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  final themeCubit = context.read<ThemeCubit>();
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CostuomFlutterToggleTap(
                        selectedIndex: themeCubit.isDark ? 0 : 1,
                        dataTabs: [
                          DataTab(icon: Icons.nightlight_round),
                          DataTab(icon: Icons.wb_sunny_outlined),
                        ],
                        selectedLabelIndex: (index) {
                          themeCubit.changeMode();
                        },
                      ),
                      CostuomFlutterToggleTap(
                        selectedIndex: context.locale.languageCode == 'ar'
                            ? 0
                            : 1,
                        dataTabs: [
                          DataTab(title: 'AR'),
                          DataTab(title: 'EN'),
                        ],
                        selectedLabelIndex: (index) {
                          context.setLocale(
                            index == 0
                                ? const Locale('ar')
                                : const Locale('en'),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              AppButton(
                text: LocaleKeys.auth_login_now.tr(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              SizedBox(height: 12.h),
              AppButton(
                text: LocaleKeys.auth_register_now.tr(),
                isOutlined: true,
                onPressed: () {},
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
