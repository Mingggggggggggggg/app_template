import 'package:app_template/main.dart';
import 'package:app_template/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          ListenableBuilder(
            listenable: themeManager,
            builder: (context, child) {
              return SliverAppBar(
                title: Text("Hallo"),
                floating: true,
                centerTitle: true,
              );
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return CardWidget(
                title: "Titel $index",
                description: "Das ist eine Beschreibung",
              );
            }, childCount: 20),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("ActionButton gedrückt");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
