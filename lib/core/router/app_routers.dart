import 'package:flavory/core/constants/app_constants.dart';
import 'package:flavory/core/screens/main_screen.dart';
import 'package:flavory/features/home_recipes/presentation/screens/home_recipes_screen.dart';
import 'package:flavory/features/search/presentation/screens/search_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  static final GoRouter router = GoRouter(
    initialLocation: AppConstants.routeHome,
    routes: [
      GoRoute(
        path: AppConstants.routeHome,
        builder: (context, state) => const MainScreen(
          child: HomeRecipesScreen(),
        ),
      ),
      GoRoute(
        path: AppConstants.routeSearch,
        builder: (context, state) => MainScreen(child: SearchScreen()),
      ),
    ],
  );
}
