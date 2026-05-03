import 'package:flavory/core/data/sources/remote/http_client.dart';
import 'package:flavory/features/search/data/repository/search_repository_impl.dart';
import 'package:flavory/features/search/data/source/search_remote.dart';
import 'package:flavory/features/search/domain/usecase/search_recipes_usecase.dart';
import 'package:flavory/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(
        usecase: SearchRecipesUsecase(
          repository: SearchRepositoryImpl(
            remote: SearchRemoteImpl(httpClient: HttpClient()),
          ),
        ),
      )..add(LoadInitialRecipesEvent()),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 255, 235),
        appBar: AppBar(
          title: Text("Search Recipes"),
        ),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          onSubmitted: (_) => BlocProvider.of<SearchBloc>(
                            context,
                          ).add(SearchRecipesEvent(_controller.text)),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Search recipes...",
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 80, 142, 76),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                        ),
                        onPressed: () =>
                            BlocProvider.of<SearchBloc>(context).add(
                              SearchRecipesEvent(_controller.text),
                            ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                        if (state.status == .loading) {
                          return Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        if (state.status == .error) {
                          return Center(
                            child: Text(state.error ?? "Error"),
                          );
                        }
                        return NotificationListener<ScrollNotification>(
                          onNotification: (scroll) {
                            if (scroll.metrics.pixels ==
                                scroll.metrics.maxScrollExtent) {
                              BlocProvider.of<SearchBloc>(
                                context,
                              ).add(LoadMoreRecipesEvent());
                            }
                            return false;
                          },
                          child: ListView.builder(
                            itemCount:
                                state.recipes.length +
                                (state.isLoadingMore ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index < state.recipes.length) {
                                final recipe = state.recipes[index];
                                return Column(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            255,
                                            255,
                                            255,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadiusGeometry.horizontal(
                                                    left: Radius.circular(12),
                                                  ),
                                              child: Image.network(
                                                recipe.image,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Text(recipe.title),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
