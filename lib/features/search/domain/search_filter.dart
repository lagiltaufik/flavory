class SearchFilter {
  final List<String> diets;
  final List<String> cuisines;
  final List<String> intolerances;
  final String? type;
  final int? minCalories;
  final int? maxCalories;
  final String sort;

  const SearchFilter({
    this.diets = const [],
    this.cuisines = const [],
    this.intolerances = const [],
    this.type,
    this.maxCalories,
    this.minCalories,
    this.sort = 'popularity',
  });

  SearchFilter copyWith({
    List<String>? diets,
    List<String>? cuisines,
    List<String>? intolerances,
    String? type,
    int? minCalories,
    int? maxCalories,
    String? sort,
  }) {
    return SearchFilter(
      diets: diets ?? this.diets,
      cuisines: cuisines ?? this.cuisines,
      intolerances: intolerances ?? this.intolerances,
      type: type ?? this.type,
      minCalories: minCalories ?? this.minCalories,
      maxCalories: maxCalories ?? this.maxCalories,
      sort: sort ?? this.sort,
    );
  }
}
