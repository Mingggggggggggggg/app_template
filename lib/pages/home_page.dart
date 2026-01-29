import 'package:app_template/data/classes/card/card_data.dart';
import 'package:app_template/l10n/app_localizations.dart';
import 'package:app_template/main.dart';
import 'package:app_template/pages/create_card_page.dart';
import 'package:app_template/widgets/card_detail_widget.dart';
import 'package:app_template/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dummy Daten zum Testen
  final List<CardItem> _items = List.generate(10, (index) {
    return PostEntry(
      id: "CardID_$index",
      title: "Hallo mein Haus brennt",
      dateTime: DateTime.now(),
      tags: index % 3 == 0 ? ["Hilfe", "Ofen", "Garten"] : ["Sonst"],
      content: [
        ContentBlock(
          """Ja also ich wollte meine Küche in eine Hotbox verwandeln und habe vllt Wasser und Gras im Ofen bei Umluft abgestellt""",
        ),
        ContentBlock(
          "Das Problem ist nun, dass die Ablage in der das Gras und das Wasser lag anscheinend sehr schnell brennt und ich habe ein Gasofen",
          attachments: [CardImage("https://picsum.photos/200/300")],
        ),
        ContentBlock(
          """Jetzt ist das alles außer Kontrolle geraten und meine Küche stand in Flammen""",
          attachments: [
            CardImage("https://picsum.photos/200/302"),
            CardImage("https://picsum.photos/201/300"),
            CardImage("https://picsum.photos/200/301"),
          ],
        ),
      ],
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          ListenableBuilder(
            listenable: themeManager,
            builder: (context, child) {
              return SliverAppBar(
                title: Text(AppLocalizations.of(context)!.hello("User")),
                floating: true,
                centerTitle: true,
              );
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = _items[index];

              return CardWidget(
                item: item,
                onTap: () {
                  // Navigation zur Detailseite
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardDetailWidget(item: item),
                    ),
                  );
                },
              );
            }, childCount: _items.length),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateCardPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
