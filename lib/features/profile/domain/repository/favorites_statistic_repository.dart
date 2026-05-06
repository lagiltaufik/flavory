abstract interface class FavoritesStatisticRepository {
  Future<List<DateTime>> getFavoritesCount(String userId);
}