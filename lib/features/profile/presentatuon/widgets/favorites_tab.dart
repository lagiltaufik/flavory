import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavory/core/data/sources/local/app_database.dart';
import 'package:flavory/features/profile/data/repository/favorites_repository_impl.dart';
import 'package:flavory/features/profile/data/source/local/favorites_list_local.dart';
import 'package:flavory/features/profile/domain/usecase/get_favorites_list_usecase.dart';
import 'package:flavory/features/profile/domain/usecase/remove_favorite_usecase.dart';
import 'package:flavory/features/profile/domain/usecase/update_is_cooked_usecase.dart';
import 'package:flavory/features/profile/presentatuon/bloc/favorites_list_bloc/favorites_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({super.key});

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesListBloc(
        remove: RemoveFavoriteUsecase(
          repo: FavoritesRepositoryImpl(
            local: FavoritesListLocalImpl(db: AppDatabase()),
          ),
        ),
        updIsCookedUc: UpdateIsCookedUsecase(
          repo: FavoritesRepositoryImpl(
            local: FavoritesListLocalImpl(db: AppDatabase()),
          ),
        ),
        usecase: GetFavoritesListUsecase(
          repository: FavoritesRepositoryImpl(
            local: FavoritesListLocalImpl(db: AppDatabase()),
          ),
        ),
      )..add(WatchFavoritesListEvent()),
      child: BlocBuilder<FavoritesListBloc, FavoritesListState>(
        builder: (context, state) {
          final favorites = state.favorites;
          return SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final item = favorites[index];
                  return Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 400,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(82, 121, 158, 118),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  10,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: item.image,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  item.title,
                                  maxLines: 3,
                                  overflow: .ellipsis,
                                ),
                              ),
                              Column(
                                children: [
                                  Expanded(
                                    child: Transform.scale(
                                      scale: 0.7,
                                      child: Switch(
                                        value: item.isCooked,
                                        onChanged: (value) {
                                          context.read<FavoritesListBloc>().add(
                                            ToggleIsCookedEvent(
                                              id: item.id,
                                              isCooked: value,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        context.read<FavoritesListBloc>().add(
                                          RemoveFavoriteEvent(id: item.id),
                                        );
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ),
                                ],
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
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
