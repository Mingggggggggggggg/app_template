import 'package:app_template/data/shared_preferences/user_settings.dart';
import 'package:app_template/pages/home_page.dart';
import 'package:app_template/pages/placeholder_page.dart';
import 'package:app_template/pages/settings_page.dart';
import 'package:app_template/widgets/nav_bar_widget.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [HomePage(), PlaceholderPage(), SettingsPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBarWidget(),
      body: ValueListenableBuilder(
        valueListenable: navBarPageNotifier,
        builder: (context, selectedPage, child) {
          return pages[selectedPage];
        },
      ),
    );
  }
}
