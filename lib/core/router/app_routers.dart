import 'package:flavory/core/constants/app_constants.dart';
import 'package:flavory/core/data/sources/remote/http_client.dart';
import 'package:flavory/core/screens/main_screen.dart';
import 'package:flavory/features/home_recipes/presentation/screens/home_recipes_screen.dart';
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
    ],
  );
}
