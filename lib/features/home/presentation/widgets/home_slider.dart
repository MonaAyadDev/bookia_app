import 'package:bookia_app/core/constants/app_color.dart';
import 'package:bookia_app/features/home/data/model/slider_response/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatelessWidget {
  final List<SliderModel> sliders;
  const HomeSlider({super.key, required this.sliders});
  @override
  Widget build(BuildContext context) {
    if (sliders.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: sliders.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    sliders[itemIndex].image ?? '',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
          options: CarouselOptions(
            height: 150,
            viewportFraction: 1,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              // cubit.onChangeSlider(index);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(height: 16.h),

        AnimatedSmoothIndicator(
          activeIndex: 0,
          count: sliders.length,

          effect: ExpandingDotsEffect(
            dotHeight: 15.h,
            dotWidth: 15.w,
            activeDotColor: AppColors.primary,
            dotColor: AppColors.white,
            expansionFactor: 4,
          ),
        ),
      ],
    );
  }
}
