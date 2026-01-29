import 'package:app_template/data/classes/card/card_data.dart';
import 'package:app_template/data/constants.dart';
import 'package:app_template/widgets/card_tag_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.item, this.onTap});

  final CardItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final description = item.previewText;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "CardID_${item.id}",
                  child: Material(
                    type: MaterialType.transparency,
                    child: Column(
                      children: [
                        Text(item.title, style: MainTextStyle.titleText),
                      ],
                    ),
                  ),
                ),
                if (item.tags.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  CardTagWidget(item: item),
                ],
                const SizedBox(height: 4),
                Text(
                  description,
                  style: MainTextStyle.descriptionText,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
