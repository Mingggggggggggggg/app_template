import 'package:app_template/data/constants.dart';
import 'package:app_template/widgets/Dropdown%20Menu%20Select/popup_menu_and_state_card.dart';
import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.itemList,
    required this.currentValue,
    this.onTap,
    this.onChanged,
  });

  final IconData icon;
  final String title;
  final List<String> itemList;
  final String currentValue;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  late String _selectedObject;

  @override
  void initState() {
    super.initState();
    _selectedObject = widget.currentValue;
  }

  @override
  void didUpdateWidget(covariant DropdownButtonWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Prüfe auf geänderte Werte, wenn ja Lade neu
    if (widget.currentValue != oldWidget.currentValue) {
      setState(() {
        _selectedObject = widget.currentValue;
      });
    }

    if (widget.itemList != oldWidget.itemList) {
      if (widget.itemList.isNotEmpty) {
        _selectedObject = widget.currentValue;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      leading: Icon(widget.icon),
      title: Text(widget.title, style: NavigationTextStyle.descriptionText),
      onTap: widget.onTap,
      trailing: PopupMenuAndStateCard(
        selectedValue: _selectedObject,
        items: widget.itemList,
        onChanged: (value) {
          setState(() {
            _selectedObject = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}
