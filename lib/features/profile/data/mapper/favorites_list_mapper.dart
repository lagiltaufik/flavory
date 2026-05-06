import 'package:flavory/features/profile/data/model/favorites_list_model.dart';
import 'package:flavory/features/profile/domain/entity/favorites_list_entity.dart';

extension FavoritesListMapper on FavoritesListModel {
  FavoritesListEntity toEntity() {
    return FavoritesListEntity(
      id: id,
      userId: userId,
      title: title,
      image: image,
      isCooked: isCooked,
      healthScore: healthScore,
      likes: likes,
    );
  }
}
