import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_finder_app/core/theme/app_palette.dart';

class CustomTab extends StatelessWidget {
  final String text;
  const CustomTab({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);

    return AnimatedBuilder(
      animation: controller.animation!,
      builder: (context, child) {
        final int currentIndex =
            (controller.animation?.value ?? controller.index).round();
        final int tabIndex = _tabIndex(context);
        final bool isSelected = currentIndex == tabIndex;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? AppPalette.primaryColor : AppPalette.gray50,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppPalette.primaryColor,
            ),
          ),
        );
      },
    );
  }

  int _tabIndex(BuildContext context) {
    final TabBar tabBar = context.findAncestorWidgetOfExactType<TabBar>()!;
    return tabBar.tabs.indexWhere((tab) => (tab as CustomTab).text == text);
  }
}
