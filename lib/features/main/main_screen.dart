import 'package:bookia_app/core/constants/app_color.dart';
import 'package:bookia_app/core/constants/images_app.dart';
import 'package:bookia_app/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int current = 0;

  List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCubit()..initLoad(),
      child: const HomeScreen(),
    ),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[current],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.storeSvg),
            activeIcon: SvgPicture.asset(
              AppImages.storeSvg,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.bookMarkSvg),
            activeIcon: SvgPicture.asset(
              AppImages.bookMarkSvg,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.cartSvg),
            activeIcon: SvgPicture.asset(
              AppImages.cartSvg,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.profileSvg),
            activeIcon: SvgPicture.asset(
              AppImages.profileSvg,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
