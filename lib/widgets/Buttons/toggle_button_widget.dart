import 'package:app_template/data/constants.dart';
import 'package:flutter/material.dart';

class ToggleButtonWidget extends StatelessWidget {
  const ToggleButtonWidget({
    super.key,
    required this.value,
    required this.icon,
    required this.title,
    required this.onChanged,
  });

  final bool value;
  final IconData icon;
  final String title;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onTap: () => onChanged(!value),
      leading: Icon(icon),
      title: Text(title, style: NavigationTextStyle.descriptionText),
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }
}
