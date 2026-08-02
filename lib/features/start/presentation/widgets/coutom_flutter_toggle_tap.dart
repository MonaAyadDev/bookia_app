import 'package:bookia_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

// ignore: must_be_immutable
class CostuomFlutterToggleTap extends StatelessWidget {
  CostuomFlutterToggleTap({
    super.key,
    required this.dataTabs,
    required this.selectedIndex,
    required this.selectedLabelIndex,
  });
  int selectedIndex;
  List<DataTab> dataTabs;
  dynamic Function(int) selectedLabelIndex;
  @override
  Widget build(BuildContext context) {
    return FlutterToggleTab(
      iconSize: 33.sp,
      width: 42,
      height: 80.h,
      borderRadius: 20,
      isScroll: false,
      selectedIndex: selectedIndex,
      selectedTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 21.sp,
        fontWeight: FontWeight.w700,
      ),
      unSelectedTextStyle: TextStyle(color: Colors.black87, fontSize: 25.sp),
      dataTabs: dataTabs,
      selectedLabelIndex: selectedLabelIndex,
      selectedBackgroundColors: const [AppColors.primary],
      unSelectedBackgroundColors: const [AppColors.white],
    );
  }
}
