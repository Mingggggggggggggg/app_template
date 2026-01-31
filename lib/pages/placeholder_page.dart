import 'package:app_template/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Placeholder")),
          DatePickerWidget(),
        ],
      ),
    );
  }
}
