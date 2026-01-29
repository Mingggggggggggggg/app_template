import 'package:app_template/data/classes/card/card_data.dart';
import 'package:flutter/material.dart';

({Color bg, Color text}) _getTagTheme(String tag) {
  final themes = [
    (bg: Colors.blue.shade100, text: Colors.blue.shade900),
    (bg: Colors.green.shade100, text: Colors.green.shade900),
    (bg: Colors.orange.shade100, text: Colors.orange.shade900),
    (bg: Colors.purple.shade100, text: Colors.purple.shade900),
    (bg: Colors.red.shade100, text: Colors.red.shade900),
    (bg: Colors.teal.shade100, text: Colors.teal.shade900),
    (bg: Colors.amber.shade100, text: Colors.amber.shade900),
  ];

  return themes[tag.hashCode.abs() % themes.length];
}

class CardTagWidget extends StatelessWidget {
  const CardTagWidget({super.key, required this.item});

  final CardItem item;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: item.tags.map((tag) {
        final theme = _getTagTheme(tag);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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
      }).toList(),
    );
  }
}
