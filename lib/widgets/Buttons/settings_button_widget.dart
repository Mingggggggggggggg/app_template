import 'package:app_template/data/constants.dart';
import 'package:flutter/material.dart';

class SettingsButtonWidget extends StatelessWidget {
  const SettingsButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      leading: Icon(icon),
      title: Text(title, style: NavigationTextStyle.descriptionText),
      onTap: onTap,
    );
  }
}
