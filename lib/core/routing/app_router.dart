import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/core/di/dependency_injection.dart';
import 'package:quote_generator_mobile_app/core/routing/routes.dart';
import 'package:quote_generator_mobile_app/features/favorites/logic/favorites_cubit.dart';
import 'package:quote_generator_mobile_app/features/favorites/ui/favorites_screen.dart';
import 'package:quote_generator_mobile_app/features/home/logic/home_cubit.dart';
import 'package:quote_generator_mobile_app/features/home/ui/home_screen.dart';

/// Manage Routes
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<HomeCubit>()..getRandomQuote()..getDataFromDatabase(),
                child: const HomeScreen(),
              ),
        );

      case Routes.favoritesScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<FavoritesCubit>()..getDataFromDatabase(),
                child: const FavoritesScreen(),
              ),
        );

      default:
        return MaterialPageRoute(
          builder:
              (context) =>
                  Scaffold(body: Text('No route defined for ${settings.name}')),
        );
    }
  }
}
