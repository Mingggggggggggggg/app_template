import 'package:app_template/data/classes/card/card_data.dart';
import 'package:animations/animations.dart';
import 'package:app_template/data/constants.dart';
import 'package:app_template/widgets/card_tag_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.item,
    required this.destinationPage,
  });

  final CardItem item;
  final Widget destinationPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: OpenContainer(
        clipBehavior: Clip.antiAlias,
        transitionType: ContainerTransitionType.fade,
        closedElevation: 2,
        openElevation: 0,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        closedColor: Theme.of(context).colorScheme.surfaceContainerLow,
        openColor: Theme.of(context).scaffoldBackgroundColor,

        transitionDuration: const Duration(milliseconds: 500),

        openBuilder: (context, action) {
          return destinationPage;
        },

        closedBuilder: (context, openContainer) {
          final description = item.previewText;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: MainTextStyle.titleText),

                if (item.tags.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  CardTagWidget(item: item),
                ],

                const SizedBox(height: 8),
                Text(
                  description,
                  style: MainTextStyle.descriptionText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
