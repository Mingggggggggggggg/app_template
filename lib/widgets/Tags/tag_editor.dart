import 'package:app_template/widgets/Tags/card_tag_widget.dart';
import 'package:flutter/material.dart';

class TagEditor extends StatefulWidget {
  final List<String> initialTags;
  final ValueChanged<List<String>> onChanged;

  const TagEditor({
    super.key,
    this.initialTags = const [],
    required this.onChanged,
  });

  @override
  State<TagEditor> createState() => _TagEditorState();
}

class _TagEditorState extends State<TagEditor> {
  late List<String> _tags;

  @override
  void initState() {
    super.initState();
    _tags = List.from(widget.initialTags);
  }

  void _showTagDialog({String? existingTag, int? index}) {
    final TextEditingController dialogController = TextEditingController(
      text: existingTag,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(existingTag == null ? "Neuer Tag" : "Tag bearbeiten"),
          content: TextField(
            controller: dialogController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Tag Name",
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _confirmTag(dialogController.text, index),
          ),
          actions: [
            if (index != null)
              TextButton(
                onPressed: () {
                  setState(() => _tags.removeAt(index));
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text("Löschen"),
              ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Abbrechen"),
            ),
            TextButton(
              onPressed: () => _confirmTag(dialogController.text, index),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _confirmTag(String text, int? index) {
    if (text.trim().isNotEmpty) {
      setState(() {
        if (index != null) {
          _tags[index] = text.trim();
        } else if (!_tags.contains(text.trim())) {
          _tags.add(text.trim());
        }
      });
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(15),
      ),
      child: CardTagWidget(
        tags: _tags,
        onTap: (tag, index) => _showTagDialog(existingTag: tag, index: index),
        trailing: IconButton.filledTonal(
          onPressed: () => _showTagDialog(),
          icon: const Icon(Icons.add),
          constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
          style: IconButton.styleFrom(padding: EdgeInsets.zero, iconSize: 18),
        ),
      ),
    );
  }
}
