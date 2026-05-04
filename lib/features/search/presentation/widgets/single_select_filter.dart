import 'package:flutter/material.dart';

class SingleSelectFilter extends StatelessWidget {
  const SingleSelectFilter({
    super.key,
    required this.title,
    required this.options,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final List<String> options;
  final String? selected;
  final Function(String value, BuildContext context) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(title),
        Wrap(
          spacing: 6,
          children: options.map((e) {
            final isSelected = selected == e;
            return ChoiceChip(
              label: Text(e),
              selected: isSelected,
              onSelected: (value) => onTap(e, context),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
