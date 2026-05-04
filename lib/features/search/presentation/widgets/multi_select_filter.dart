import 'package:flutter/material.dart';

class MultiSelectFilter extends StatelessWidget {
  const MultiSelectFilter({
    super.key,
    required this.title,
    required this.options,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final List<String> options;
  final List<String> selected;
  final Function(String value, BuildContext context) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Wrap(
          spacing: 6,
          children: options.map((e) {
            final isSelected = selected.contains(e);

            return FilterChip(
              label: Text(e),
              selected: isSelected,
              onSelected: (_) => onTap(e, context),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
