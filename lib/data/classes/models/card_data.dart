abstract class CardData {}

class CardImage {
  final String imageUrl;
  final String caption;

  CardImage(this.imageUrl, {this.caption = ""});
}

class ContentBlock extends CardData {
  final String text;
  final bool isHeader;

  final List<CardImage> attachments;

  ContentBlock(this.text, {this.isHeader = false, this.attachments = const []});
}

abstract class CardItem {
  final String id;
  final String title;
  final DateTime dateTime;
  final List<String> tags;

  final List<CardData> content;

  CardItem({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.tags,
    required this.content,
  });

  String? get previewImageUrl {
    for (var block in content) {
      if (block is ContentBlock && block.attachments.isNotEmpty) {
        return block.attachments.first.imageUrl;
      }
    }
    return null;
  }

  String get previewText {
    for (var block in content) {
      if (block is ContentBlock && !block.isHeader) {
        return block.text;
      }
    }
    return "Keine Beschreibung";
  }
}

// Verwende CardItem
class PostEntry extends CardItem {
  PostEntry({
    required super.id,
    required super.title,
    required super.dateTime,
    required super.tags,
    required super.content,
  });
}
