import 'package:app_template/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialogWidget extends StatefulWidget {
  const ColorPickerDialogWidget({
    super.key,
    required this.currentColor,
    required this.selectedColor,
  });

  final Color currentColor;
  final ValueChanged<Color> selectedColor;

  @override
  State<ColorPickerDialogWidget> createState() =>
      _ColorPickerDialogWidgetState();
}

class _ColorPickerDialogWidgetState extends State<ColorPickerDialogWidget> {
  late Color _tempColor;

  @override
  void initState() {
    super.initState();
    _tempColor = widget.currentColor;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.selectColor),
      clipBehavior: Clip.hardEdge,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HueRingPicker(
              pickerColor: _tempColor,
              onColorChanged: (Color color) {
                setState(() {
                  _tempColor = color;
                });
              },
              enableAlpha: false,
              displayThumbColor: true,
            ),
          ],
        ),
      ),

      actions: [
        TextButton(
          onPressed: () {
            widget.selectedColor(Colors.teal);
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.reset),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        FilledButton(
          onPressed: () {
            widget.selectedColor(_tempColor);
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.save),
        ),
      ],
    );
  }
}
