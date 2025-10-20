import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/features/home_layout/presentation/ui/screens/home_layout_screen.dart';
import '../../features/favorites/presentation/ui/screens/favorites_screen.dart';
import '../../features/home/presentation/ui/screens/home_screen.dart';
import '../../features/messages/presentation/ui/screens/messages_screen.dart';
import '../../features/onboarding/presentation/ui/screens/onboarding_screen.dart';
import '../../features/profile/presentation/ui/screens/profile_screen.dart';
import '../../features/splash/presentation/ui/screens/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.homeLayoutScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeLayoutScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      // case Routes.detailsScreen:
      //   return MaterialPageRoute(builder: (context) => const DetailsScreen());
      case Routes.favoriteScreen:
        return MaterialPageRoute(builder: (context) => const FavoritesScreen());
      case Routes.messageScreen:
        return MaterialPageRoute(builder: (context) => const MessagesScreen());
      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
    }
    return null;
  }
}
