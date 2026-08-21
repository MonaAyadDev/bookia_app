import 'package:bookia_app/core/constants/images_app.dart';
import 'package:bookia_app/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/widgets/book_item.dart';
import 'package:bookia_app/features/home/presentation/widgets/home_slider.dart';
import 'package:bookia_app/generated/lib/gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SvgPicture.asset(AppImages.logoSvg, height: 30.h),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();

            if (state is HomeLoading || state is HomeInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HomeError) {
              return const Center(child: Text('حصل خطأ، حاول تاني'));
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeSlider(sliders: cubit.sliders ?? []),
                  SizedBox(height: 30.h),
                  Text(
                    LocaleKeys.home_best_seller.tr(),
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(fontSize: 28.sp),
                  ),
                  SizedBox(height: 30.h),
                  GridView.builder(
                    itemCount:cubit.products?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 11,
                          crossAxisSpacing: 11,
                          childAspectRatio: 0.62,
                        ),
                    itemBuilder: (context, index) {
                      return BookItem(product: cubit.products![index]);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
