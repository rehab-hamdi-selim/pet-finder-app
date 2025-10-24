import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_finder_app/core/theme/app_palette.dart';
import 'package:pet_finder_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/cubit/home_state.dart';
import '../widgets/custom_tab.dart';
import '../widgets/custom_tab_bar_view_widget.dart';
import '../widgets/pet_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.h,
            children: [
              SizedBox(height: 50.h),
              _buildHeader(),
              _buildSearchBar(),
              _buildCategoryTabs(),
              Expanded(
                child: BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      error: (msg) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(msg),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return state.when(
                      initial: () =>
                          const Center(child: Text('Loading breeds...')),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      loaded: (breeds) => TabBarView(
                        children: [
                          // ✅ All
                          CustomTabViewWidget(
                            tabName: 'All',
                            items: breeds,
                            itemBuilder: (breed) => PetCard(
                              name: breed.name ?? 'Unknown',
                              gender: 'N/A',
                              age: breed.lifeSpan != null
                                  ? '${breed.lifeSpan} years'
                                  : 'N/A',
                              distance: breed.origin ?? 'Unknown Origin',
                              imagePath: 'assets/images/pets.png',
                            ),
                          ),

                          // ✅ Dogs (placeholder)
                          CustomTabViewWidget(
                            tabName: 'Dogs',
                            items: const [],
                            itemBuilder: (item) => const SizedBox.shrink(),
                          ),

                          // ✅ Cats (same data as All)
                          CustomTabViewWidget(
                            tabName: 'Cats',
                            items: breeds,
                            itemBuilder: (breed) => PetCard(
                              name: breed.name ?? 'Unknown',
                              gender: 'N/A',
                              age: breed.lifeSpan != null
                                  ? '${breed.lifeSpan} years'
                                  : 'N/A',
                              distance: breed.origin ?? 'Unknown Origin',
                              imagePath: 'assets/images/pets.png',
                            ),
                          ),

                          // ✅ Birds
                          CustomTabViewWidget(
                            tabName: 'Birds',
                            items: const [],
                            itemBuilder: (item) => const SizedBox.shrink(),
                          ),

                          // ✅ Fish
                          CustomTabViewWidget(
                            tabName: 'Fish',
                            items: const [],
                            itemBuilder: (item) => const SizedBox.shrink(),
                          ),

                          // ✅ Other
                          CustomTabViewWidget(
                            tabName: 'Other',
                            items: const [],
                            itemBuilder: (item) => const SizedBox.shrink(),
                          ),
                        ],
                      ),
                      error: (message) => Center(
                        child: Text(
                          "❌ $message",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Find your Forever Pet',
        style: GoogleFonts.poppins(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      ImageIcon(
        const AssetImage('assets/images/icons/notification.png'),
        color: AppPalette.black50,
        size: 24.r,
      ),
    ],
  );

  Widget _buildSearchBar() => Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    height: 42.h,
    decoration: BoxDecoration(
      color: AppPalette.gray50,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Row(
      children: [
        ImageIcon(
          const AssetImage('assets/images/icons/search.png'),
          size: 20.h,
          color: Colors.black,
        ),
        SizedBox(width: 12.w),
        Text(
          'Search',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            color: AppPalette.gray100,
          ),
        ),
        const Spacer(),
        ImageIcon(
          const AssetImage('assets/images/icons/settings.png'),
          size: 20.h,
          color: AppPalette.black50,
        ),
      ],
    ),
  );

  Widget _buildCategoryTabs() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 10.h,
    children: [
      Text(
        'Categories',
        style: GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
        indicator: const BoxDecoration(),
        dividerColor: Colors.transparent,
        tabs: const [
          CustomTab(text: 'All'),
          CustomTab(text: 'Dogs'),
          CustomTab(text: 'Cats'),
          CustomTab(text: 'Birds'),
          CustomTab(text: 'Fish'),
          CustomTab(text: 'Other'),
        ],
      ),
    ],
  );
}
