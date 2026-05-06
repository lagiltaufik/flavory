import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavory/core/constants/app_constants.dart';
import 'package:flavory/core/services/auth_redirect_storage.dart';
import 'package:flavory/core/services/toast_service.dart';
import 'package:flavory/core/utils/recipesource/recipe_source.dart';
import 'package:flavory/features/recipe_details/domain/entity/instructions_step_entity.dart';
import 'package:flavory/features/recipe_details/presentation/bloc/recipe_details_bloc/recipe_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key, required this.id, required this.source});
  final int id;
  final RecipeSource source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  if (context.read<RecipeDetailsBloc>().state.requireAuth) {
                    AuthRedirectStorage.save(
                      GoRouterState.of(context).uri.toString(),
                    );
                    context.push(
                      AppConstants.routeAuth,
                    );
                  } else {
                    final user = FirebaseAuth.instance.currentUser!;
                    context.read<RecipeDetailsBloc>().add(
                      ToggleFavoriteEvent(),
                    );
                  }
                },
                icon: Icon(
                  context.read<RecipeDetailsBloc>().state.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocListener<RecipeDetailsBloc, RecipeDetailsState>(
          listenWhen:
              (RecipeDetailsState previous, RecipeDetailsState current) {
                return previous.error != current.error && current.error != null;
              },
          listener: (context, state) {
            if (state.status == .error) {
              ToastService.showError(state.error.toString());
            }
          },
          child: BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
            builder: (context, state) {
              if (state.status == .loading) {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state.recipe == null) {
                return Center(
                  child: Column(
                    children: [
                      Text("No data"),
                      ElevatedButton(
                        onPressed: () {
                          final user = FirebaseAuth.instance.currentUser!;
                          context.read<RecipeDetailsBloc>().add(
                            GetRecipeDetailEvent(id, user.uid),
                          );
                        },
                        child: Text("Try again"),
                      ),
                    ],
                  ),
                );
              }
              final recipe = state.recipe;
              final List<InstructionsStepEntity> instruction =
                  state.recipe!.steps;

              return Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    recipe!.title,
                    style: TextStyle(
                      fontWeight: .bold,
                      fontSize: 18,
                      color: const Color.fromARGB(255, 5, 71, 5),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: recipe.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.eco_sharp,
                              size: 18,
                              color: const Color.fromARGB(255, 136, 169, 137),
                            ),
                            Text(
                              "health score: ${recipe.healthScore}",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 136, 169, 137),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "${recipe.aggregateLikes}",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 136, 169, 137),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.favorite,
                        size: 16,
                        color: const Color.fromARGB(255, 136, 169, 137),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (state.dietType.isNotEmpty)
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Diet type",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        ...state.dietType.map((e) => Text(e.toString())),
                      ],
                    ),
                  SizedBox(
                    height: 16,
                  ),

                  Text(
                    "Instruction",
                    style: TextStyle(fontWeight: .bold, fontSize: 16),
                  ),
                  if (instruction.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemCount: instruction.length,
                        itemBuilder: (context, index) {
                          final step = instruction[index];
                          return Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "Step ${step.number}",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                step.step,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  if (instruction.isEmpty) Text(recipe.instructions),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
