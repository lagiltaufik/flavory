import 'package:flavory/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:flavory/features/search/presentation/widgets/multi_select_filter.dart';
import 'package:flavory/features/search/presentation/widgets/single_select_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final filter = state.filter;
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Center(
                  child: Text(
                    "Filters",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                MultiSelectFilter(
                  title: "Diet",
                  options: const [
                    "vegetarian",
                    "vegan",
                    "ketogenic",
                    "gluten free",
                  ],
                  selected: filter.diets,
                  onTap: (value, context) {
                    BlocProvider.of<SearchBloc>(
                      context,
                    ).add(ToggleDietEvent(value));
                  },
                ),
                MultiSelectFilter(
                  title: "Cuisine",
                  options: const ["italian", "mexican", "indian", "french"],
                  selected: filter.cuisines,
                  onTap: (value, context) {
                    BlocProvider.of<SearchBloc>(
                      context,
                    ).add(ToggleCuisineEvent(value));
                  },
                ),
                MultiSelectFilter(
                  title: "Allergies",
                  options: const [
                    "dairy",
                    "gluten",
                    "peanut",
                    "seafood",
                    "egg",
                  ],
                  selected: filter.intolerances,
                  onTap: (value, context) {
                    context.read<SearchBloc>().add(
                      ToggleIntolearnceEvent(value),
                    );
                  },
                ),
                SingleSelectFilter(
                  title: "Type",
                  options: const [
                    "main course",
                    "soup",
                    "dessert",
                    "salad",
                    "breakfast",
                  ],
                  selected: filter.type,
                  onTap: (value, context) {
                    context.read<SearchBloc>().add(
                      SelectTypeEvent(value),
                    );
                  },
                ),
                SingleSelectFilter(
                  title: "Sort",
                  options: const [
                    "popularity",
                    "healthiness",
                    "time",
                    "calories",
                  ],
                  selected: filter.sort,
                  onTap: (value, context) {
                    context.read<SearchBloc>().add(
                      SelectSortEvent(value),
                    );
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text("Calories"),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Min",
                        ),
                        onChanged: (value) {
                          BlocProvider.of<SearchBloc>(
                            context,
                          ).add(SetMinCaloriesEvent(int.tryParse(value)));
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Max",
                        ),
                        onChanged: (value) => BlocProvider.of<SearchBloc>(
                          context,
                        ).add(SetMaxCaloriesEvent(int.tryParse(value))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<SearchBloc>().add(ApplyFilterEvent());
                      Navigator.pop(context);
                    },
                    child: Text("Apply"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
