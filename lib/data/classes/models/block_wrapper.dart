import 'package:app_template/data/classes/models/card_data.dart';
import 'package:flutter/material.dart';

class BlockWrapper {
  final String id = UniqueKey().toString();

  final TextEditingController textController;
  final List<CardImage> images;

  bool isImageFocused;

  BlockWrapper({
    String initialText = "",
    List<CardImage>? initialImages,
    this.isImageFocused = false,
  }) : textController = TextEditingController(text: initialText),
       images = initialImages ?? [];

  ContentBlock toContentBlock() {
    return ContentBlock(textController.text, attachments: List.from(images));
  }
}
