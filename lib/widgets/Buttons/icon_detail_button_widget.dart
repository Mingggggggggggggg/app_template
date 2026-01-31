import 'package:app_template/data/constants.dart';
import 'package:flutter/material.dart';

class IconDetailButtonWidget extends StatelessWidget {
  const IconDetailButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      leading: Icon(icon),
      title: Text(title, style: NavigationTextStyle.descriptionText),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
