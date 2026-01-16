import 'package:app_template/data/constants.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.description,
    this.onTap,
  });

  final String title;
  final String description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Card(
        child: InkWell(
          onTap: () => print("Test"),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: MainTextStyle.titleText),
                Text(description, style: MainTextStyle.descriptionText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
