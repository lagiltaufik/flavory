import 'package:flavory/features/home_recipes/presentation/widgets/recipe_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecipeSectionShimmer extends StatelessWidget {
  const RecipeSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Container(
          height: 22,
          width: 120,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.grey.shade300,
        ),
        const SizedBox(
          height: 17,
        ),
        SizedBox(
          height: 180,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) => const SizedBox(
                width: 12,
              ),
              itemBuilder: (context, index) => const RecipeCardShimmer(),
              itemCount: 5,
            ),
          ),
        ),
        const SizedBox(
          height: 26,
        ),
      ],
    );
  }
}
