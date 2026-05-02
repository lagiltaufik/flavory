import 'package:flutter/material.dart';

class RecipeCardShimmer extends StatelessWidget {
  const RecipeCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade300,
      ),
    );
  }
}
