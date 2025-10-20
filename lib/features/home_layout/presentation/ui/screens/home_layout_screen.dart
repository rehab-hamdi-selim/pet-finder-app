import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/theme/app_palette.dart';

import '../../../../favorites/presentation/ui/screens/favorites_screen.dart';
import '../../../../home/presentation/ui/screens/home_screen.dart';
import '../../../../messages/presentation/ui/screens/messages_screen.dart';
import '../../../../profile/presentation/ui/screens/profile_screen.dart';
import '../../../data/models/nav_item_data.dart';
import '../widgets/build_nav_item.dart';
import '../../cubit/nav_index_cubit.dart';
import '../../cubit/nav_index_state.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = const [
      HomeScreen(),
      FavoritesScreen(),
      MessagesScreen(),
      ProfileScreen(),
    ];

    final List<NavItemData> navItems = [
      NavItemData('assets/images/icons/home.png', 'Home'),
      NavItemData('assets/images/icons/nav_heart.png', 'Favorites'),
      NavItemData('assets/images/icons/messages.png', 'Messages'),
      NavItemData('assets/images/icons/profile.png', 'Profile'),
    ];

    return BlocProvider(
      create: (_) => NavIndexCubit(),
      child: BlocBuilder<NavIndexCubit, NavIndexState>(
        builder: (context, state) {
          final cubit = context.read<NavIndexCubit>();

          return Scaffold(
            body: screens[state.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 10,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: state.currentIndex,
              selectedItemColor: AppPalette.primaryColor,
              unselectedItemColor: Colors.grey,
              onTap: cubit.changeIndex,
              items: List.generate(
                navItems.length,
                (index) =>
                    buildNavItem(navItems[index], index, state.currentIndex),
              ),
            ),
          );
        },
      ),
    );
  }
}
