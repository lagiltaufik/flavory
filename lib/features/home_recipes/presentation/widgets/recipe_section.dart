import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavory/features/home_recipes/domain/entity/home_recipes_entity.dart';
import 'package:flutter/material.dart';

class RecipeSection extends StatelessWidget {
  final String title;
  final List<HomeRecipesEntity> recipes;
  const RecipeSection({super.key, required this.title, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => const SizedBox(
              width: 12,
            ),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final item = recipes[index];
              return Container(
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadiusGeometry.vertical(
                          top: Radius.circular(12),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: item.image,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        item.title,
                        maxLines: 2,
                        overflow: .ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
