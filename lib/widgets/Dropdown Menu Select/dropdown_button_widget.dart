import 'package:app_template/data/constants.dart';
import 'package:app_template/widgets/Dropdown%20Menu%20Select/popup_menu_and_state_card.dart';
import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.itemList,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final List<String> itemList;
  final VoidCallback? onTap;

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  late String _selectedObject;

  @override
  void initState() {
    super.initState();
    _selectedObject = widget.itemList.isNotEmpty ? widget.itemList.first : "";
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
        },
      ),
    );
  }
}
