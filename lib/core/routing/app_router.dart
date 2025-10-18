import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splashScreen:
      //   return MaterialPageRoute(builder: (context) => const SplashScreen());
      // case Routes.onboardingScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const OnboardingScreen(),
      //   );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(builder: (context) => const HomeScreen());
      // case Routes.detailsScreen:
      //   return MaterialPageRoute(builder: (context) => const DetailsScreen());
      // case Routes.favoriteScreen:
      //   return MaterialPageRoute(builder: (context) => const FavoriteScreen());
      // case Routes.chatScreen:
      //   return MaterialPageRoute(builder: (context) => const ChatScreen());
      // case Routes.settingsScreen:
      //   return MaterialPageRoute(builder: (context) => const SettingsScreen());
    }
    return null;
  }
}
