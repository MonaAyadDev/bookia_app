import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyArrowBack extends StatelessWidget {
  const MyArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFE8ECF4), // لون الـ Border
            width: 1,
          ),
        ),

        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0xFF1E232C), // لون السهم
          size: 20.sp,
          weight: 500.w,
        ),
      ),
    );
  }
}
