import 'package:flutter/material.dart';

class PopupMenuAndStateCard extends StatelessWidget {
  const PopupMenuAndStateCard({
    super.key,

    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  final String selectedValue;
  final List<String> items;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          child: PopupMenuButton<String>(
            offset: const Offset(10, 45),
            onSelected: onChanged,

            itemBuilder: (context) {
              return items.map((String value) {
                return PopupMenuItem(value: value, child: Text(value));
              }).toList();
            },

            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),

              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedValue,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
