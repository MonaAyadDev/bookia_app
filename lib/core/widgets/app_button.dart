import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppButton extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;
  final String? icon;
  final bool isOutlined;

  final double? width;

  final double height;
  final double? fontSize;
  final double borderRadius;
  final FontWeight? fontWeight;

  const AppButton({
    this.icon,
    this.fontWeight,
    this.fontSize,
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
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );

    return SizedBox(
      width: width ?? double.infinity,
      height: height.h,
      child: isOutlined
          ? OutlinedButton(
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    SvgPicture.asset(icon!),
                    SizedBox(width: 8.w),
                  ],
                  textWidget,
                ],
              ),
            )
          : ElevatedButton(onPressed: onPressed, child: textWidget),
    );
  }
}
