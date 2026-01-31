import 'package:app_template/l10n/app_localizations.dart';
import 'package:app_template/widgets/Tags/tag_editor.dart';
import 'package:app_template/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';

class CreateCardPage extends StatefulWidget {
  const CreateCardPage({super.key});

  @override
  State<CreateCardPage> createState() => _CreateCardPageState();
}

class _CreateCardPageState extends State<CreateCardPage> {
  final TextEditingController _controllerTitle = TextEditingController();

  List<String> _currentTags = [];

  @override
  void dispose() {
    _controllerTitle.dispose();
    super.dispose();
  }

  void _saveCard() {
    print("Speichere Tags: $_currentTags");
    print("Titel: ${_controllerTitle.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Card"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                ),
                IconButton(
                  onPressed: _saveCard,
                  icon: const Icon(Icons.save_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controllerTitle,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: AppLocalizations.of(context)!.inputTitle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const DatePickerWidget(setDefault: true),
                ],
              ),

              const SizedBox(height: 10),

              const Text(
                "Tags",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),

              TagEditor(
                initialTags: _currentTags,
                onChanged: (newTags) {
                  _currentTags = newTags;
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
