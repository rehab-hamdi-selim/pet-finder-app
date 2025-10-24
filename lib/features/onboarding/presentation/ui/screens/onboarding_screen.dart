import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_palette.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/pets.png',
              width: 442.w,
              height: 305.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 35.h),
            Text(
              'Find Your Best Companion With Us',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: AppPalette.black500,
              ),
            ),
            Text(
              'Join & discover the best suitable pets as per your preferences in your location',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                color: AppPalette.gray150,
              ),
            ),
            SizedBox(height: 30.h),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.homeLayoutScreen,
                  (route) => false,
                );
              },
              child: Container(
                width: 279.w,
                height: 54.h,
                decoration: BoxDecoration(
                  color: AppPalette.primaryColor,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  spacing: 12.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icons/pet_hand.png',
                      width: 24.w,
                      height: 24.h,
                    ),
                    Text(
                      'Get Started',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
