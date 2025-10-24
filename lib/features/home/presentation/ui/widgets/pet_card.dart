import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_finder_app/core/theme/app_palette.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String gender;
  final String age;
  final String distance;
  final String imagePath;

  const PetCard({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    required this.distance,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 343.w,
        height: 130.h,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppPalette.primaryColor50,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
                SizedBox(width: 10.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 5.h,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        gender,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: AppPalette.gray200,
                        ),
                      ),
                      Text(
                        age,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: AppPalette.gray200,
                        ),
                      ),
                      Row(
                        children: [
                          ImageIcon(
                            const AssetImage(
                              'assets/images/icons/location.png',
                            ),
                            color: Colors.red,
                            size: 16.r,
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Text(
                              distance,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                color: AppPalette.gray200,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h, left: 4.w),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: AppPalette.primaryColor,
                      size: 22.r,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
