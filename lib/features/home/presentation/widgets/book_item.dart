import 'package:bookia_app/core/constants/app_color.dart';
import 'package:bookia_app/core/widgets/app_button.dart';
import 'package:bookia_app/features/home/data/model/best_seller/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
    final Product product;
  const BookItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lightSurface,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network( product.image ?? '', fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 16),

          Text(
             product.name ?? '',
            maxLines: 1,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 14.sp),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${product.priceAfterDiscount ?? product.price}',
                maxLines: 1,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontSize: 14.sp),
              ),
              SizedBox(
                height: 30,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: AppButton(width: 80.w, text: 'Buy', onPressed: () {}),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
