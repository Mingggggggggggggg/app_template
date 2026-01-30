import 'package:app_template/data/classes/card/card_data.dart';
import 'package:app_template/data/constants.dart';
import 'package:app_template/widgets/card_tag_widget.dart';
import 'package:flutter/material.dart';

class CardDetailWidget extends StatelessWidget {
  const CardDetailWidget({super.key, required this.item});

  final CardItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(item.title, style: MainTextStyle.titleText),
            const SizedBox(height: 5),
            CardTagWidget(item: item),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${item.dateTime.day}.${item.dateTime.month}.${item.dateTime.year}",
                ),
                const SizedBox(width: 5),
              ],
            ),
            Divider(height: 30),

            ...item.content.map((block) => _buildSection(context, block)),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, CardData data) {
    if (data is ContentBlock) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  data.text,
                  style: data.isHeader
                      ? const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )
                      : const TextStyle(fontSize: 16, height: 1.5),
                ),
              ),

            if (data.attachments.isNotEmpty)
              _buildAttachments(context, data.attachments),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildAttachments(BuildContext context, List<CardImage> images) {
    if (images.length == 1) {
      final img = images.first;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              img.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          if (img.caption.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                img.caption,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                  fontSize: 13,
                ),
              ),
            ),
        ],
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(images[index].imageUrl, fit: BoxFit.cover),
        );
      },
    );
  }
}
