import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;

  final bool isOutlined;

  final double? width;

  final double height;

  final double borderRadius;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.width,
    this.height = 56,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
    );

    return SizedBox(
      width: width ?? double.infinity,
      height: height.h,
      child: isOutlined
          ? OutlinedButton(onPressed: onPressed, child: textWidget)
          : ElevatedButton(onPressed: onPressed, child: textWidget),
    );
  }
}
