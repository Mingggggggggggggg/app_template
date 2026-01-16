import 'package:app_template/data/shared_preferences/user_settings.dart';
import 'package:app_template/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          ValueListenableBuilder(
            valueListenable: darkmodeNotifier,
            builder: (context, isDarkmode, child) {
              return SliverAppBar(
                title: Text("SliverAppBar"),
                floating: true,
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () async {
                      darkmodeNotifier.value = !darkmodeNotifier.value;
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool(
                        "userThemeKey",
                        darkmodeNotifier.value,
                      );
                    },
                    icon: Icon(
                      isDarkmode
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                    ),
                  ),
                ],
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
