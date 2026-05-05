import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavory/core/constants/app_constants.dart';
import 'package:flavory/core/data/sources/local/app_database.dart';
import 'package:flavory/core/data/sources/remote/http_client.dart';
import 'package:flavory/core/screens/main_screen.dart';
import 'package:flavory/core/services/auth_service.dart';
import 'package:flavory/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flavory/features/auth/presentation/screens/auth_screen.dart';
import 'package:flavory/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flavory/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flavory/features/home_recipes/presentation/screens/home_recipes_screen.dart';
import 'package:flavory/features/profile/presentatuon/screens/profile_screen.dart';
import 'package:flavory/features/recipe_details/data/repository/recipe_detail_repository_impl.dart';
import 'package:flavory/features/recipe_details/data/source/local/favorites_local.dart';
import 'package:flavory/features/recipe_details/data/source/remote/detail_remote.dart';
import 'package:flavory/features/recipe_details/domain/usecase/get_detail_recipe_usecase.dart';
import 'package:flavory/features/recipe_details/presentation/bloc/recipe_details_bloc/recipe_details_bloc.dart';
import 'package:flavory/features/recipe_details/presentation/screens/recipe_detail_screen.dart';
import 'package:flavory/features/search/data/repository/search_repository_impl.dart';
import 'package:flavory/features/search/data/source/search_remote.dart';
import 'package:flavory/features/search/domain/usecase/search_recipes_usecase.dart';
import 'package:flavory/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:flavory/features/search/presentation/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  static final GoRouter router = GoRouter(
    initialLocation: AppConstants.routeHome,
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;
      final goingToProfile = state.matchedLocation == AppConstants.routeProfile;

      if (goingToProfile && authState is Unauthenticated) {
        return AppConstants.routeAuth;
      }

      final isAuthFlow =
          state.matchedLocation == AppConstants.routeAuth ||
          state.matchedLocation == AppConstants.routeSignup ||
          state.matchedLocation == AppConstants.routeSignin;

      if (authState is Authenticated && isAuthFlow) {
        return AppConstants.routeProfile;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppConstants.routeHome,
        builder: (context, state) => const MainScreen(
          child: HomeRecipesScreen(),
        ),
      ),
      GoRoute(
        path: AppConstants.routeSearch,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBloc(
            usecase: SearchRecipesUsecase(
              repository: SearchRepositoryImpl(
                remote: SearchRemoteImpl(httpClient: HttpClient()),
              ),
            ),
          )..add(LoadInitialRecipesEvent()),
          child: MainScreen(child: SearchScreen()),
        ),
      ),
      GoRoute(
        path: AppConstants.routeSignin,
        builder: (context, state) => MainScreen(child: SignInScreen()),
      ),
      GoRoute(
        path: AppConstants.routeSignup,
        builder: (context, state) => MainScreen(child: SignUpScreen()),
      ),
      GoRoute(
        path: AppConstants.routeAuth,
        builder: (context, state) => MainScreen(child: AuthScreen()),
      ),
      GoRoute(
        path: AppConstants.routeProfile,
        builder: (context, state) => MainScreen(child: ProfileScreen()),
      ),
      GoRoute(
        path: "${AppConstants.routeDeatil}/:id",
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return BlocProvider(
            create: (context) => RecipeDetailsBloc(
              authService: AuthService(FirebaseAuth.instance),
              favoritesLocal: FavoritesLocalImpl(db: AppDatabase()),
              usecase: GetDetailRecipeUsecase(
                repository: RecipeDetailRepositoryImpl(
                  remote: DetailRemoteImpl(httpClient: HttpClient()),
                ),
              ),
            )..add(GetRecipeDetailEvent(id)),
            child: MainScreen(child: RecipeDetailScreen(id: id)),
          );
        },
      ),
    ],
  );
}
