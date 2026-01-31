import 'package:app_template/data/constants.dart';
import 'package:app_template/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key, this.setDefault});

  final bool? setDefault;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  void initState() {
    if (widget.setDefault == true) {
      selectedDate = DateTime.now();
    }
    super.initState();
  }

  DateTime? selectedDate;
  DateTime currentDate = DateTime.now();
  DateTime firstDate = DateTime(DateTime.now().year - 1);
  DateTime lastDate = DateTime(DateTime.now().year + 1);

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            selectedDate != null
                ? '${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year}'
                : AppLocalizations.of(context)!.noDateSelected,
            style: NavigationTextStyle.userSelect,
          ),
          FilledButton(
            onPressed: _selectDate,
            child: Text(AppLocalizations.of(context)!.selectDate),
          ),
        ],
      ),
    );
  }
}
