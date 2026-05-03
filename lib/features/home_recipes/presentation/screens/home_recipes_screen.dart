import 'dart:developer';

import 'package:flavory/core/data/sources/local/app_database.dart';
import 'package:flavory/core/data/sources/remote/http_client.dart';
import 'package:flavory/core/services/toast_service.dart';
import 'package:flavory/core/utils/statuses/statuses.dart';
import 'package:flavory/core/widgets/error_view.dart';
import 'package:flavory/features/home_recipes/data/repository/home_recipes_repository_impl.dart';
import 'package:flavory/features/home_recipes/data/source/recipes_local.dart';
import 'package:flavory/features/home_recipes/data/source/recipes_remote.dart';
import 'package:flavory/features/home_recipes/domain/usecase/get_home_recipes_usecase.dart';
import 'package:flavory/features/home_recipes/presentation/bloc/home_recipes_bloc/home_recipes_bloc.dart';
import 'package:flavory/features/home_recipes/presentation/widgets/recipe_section.dart';
import 'package:flavory/features/home_recipes/presentation/widgets/recipe_section_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRecipesScreen extends StatelessWidget {
  const HomeRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeRecipesBloc>(
      create: (context) {
        log("BLOC CREATED");
        return HomeRecipesBloc(
          usecase: GetHomeRecipesUsecase(
            repository: HomeRecipesRepositoryImpl(
              local: RecipesLocalImpl(db: AppDatabase()),
              remote: RecipesRemoteImpl(httpClient: HttpClient()),
            ),
          ),
        )..add(GetHomeRecipesEvent());
      },
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("What to cook today"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocListener<HomeRecipesBloc, HomeRecipesState>(
              listenWhen:
                  (HomeRecipesState previous, HomeRecipesState current) {
                    return previous.error != current.error &&
                        current.error != null;
                  },
              listener: (context, state) {
                final hasData = state.sections.values.any(
                  (list) => list.isNotEmpty,
                );
                if (state.error != null && hasData) {
                  ToastService.showError(state.error!);
                }
              },
              child: BlocBuilder<HomeRecipesBloc, HomeRecipesState>(
                builder: (context, state) {
                  final hasData = state.sections.values.any(
                    (list) => list.isNotEmpty,
                  );
                  final entries = state.sections.entries
                      .where((e) => e.value.isNotEmpty)
                      .toList();

                  if (state.status == Statuses.loading && !hasData) {
                    return SafeArea(
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return RecipeSectionShimmer();
                        },
                      ),
                    );
                  }
                  if (state.status == Statuses.error &&
                      state.sections.isEmpty) {
                    return ErrorView(
                      message: state.error ?? "Error",
                      onRetry: () {
                        context.read<HomeRecipesBloc>().add(
                          const GetHomeRecipesEvent(),
                        );
                      },
                    );
                  }

                  return SafeArea(
                    child: ListView.builder(
                      itemCount: entries.length,
                      itemBuilder: (context, index) {
                        final section = entries[index];
                        return RecipeSection(
                          title: section.key,
                          recipes: section.value,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
