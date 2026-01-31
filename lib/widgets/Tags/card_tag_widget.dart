import 'package:app_template/data/classes/card/card_data.dart';
import 'package:flutter/material.dart';

class CardTagWidget extends StatelessWidget {
  const CardTagWidget({
    super.key,
    required this.tags,
    this.onTap,
    this.trailing,
  });

  factory CardTagWidget.fromItem(CardItem item) {
    return CardTagWidget(tags: item.tags);
  }

  final List<String> tags;
  final Function(String tag, int index)? onTap;
  final Widget? trailing;

  ({Color bg, Color text}) _getTagTheme(String tag) {
    final themes = [
      (bg: Colors.blue.shade100, text: Colors.blue.shade900),
      (bg: Colors.green.shade100, text: Colors.green.shade900),
      (bg: Colors.orange.shade100, text: Colors.orange.shade900),
      (bg: Colors.purple.shade100, text: Colors.purple.shade900),
      (bg: Colors.red.shade100, text: Colors.red.shade900),
      (bg: Colors.teal.shade100, text: Colors.teal.shade900),
      (bg: Colors.amber.shade100, text: Colors.amber.shade900),
      (bg: Colors.brown.shade100, text: Colors.brown.shade900),
      (bg: Colors.pink.shade100, text: Colors.pink.shade900),
      (bg: Colors.indigo.shade100, text: Colors.indigo.shade900),
      (bg: Colors.lime.shade100, text: Colors.lime.shade900),
    ];
    return themes[tag.hashCode.abs() % themes.length];
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...tags.asMap().entries.map((entry) {
          final index = entry.key;
          final tag = entry.value;
          final theme = _getTagTheme(tag);

          Widget chip = Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: theme.bg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              tag,
              style: TextStyle(
                color: theme.text,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          );

          if (onTap != null) {
            return GestureDetector(
              onTap: () => onTap!(tag, index),
              child: chip,
            );
          }
          return chip;
        }),

        if (trailing != null) trailing!,
      ],
    );
  }
}
