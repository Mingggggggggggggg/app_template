import 'package:app_template/data/shared_preferences/user_settings.dart';
import 'package:flutter/material.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: navBarPageNotifier,
      builder: (context, selectedNavBarPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Main"),
            NavigationDestination(
              icon: Icon(Icons.local_activity),
              label: "Placeholder",
            ),
            NavigationDestination(icon: Icon(Icons.more_horiz), label: "More"),
          ],
          onDestinationSelected: (int value) {
            navBarPageNotifier.value = value;
          },
          selectedIndex: selectedNavBarPage,
        );
      },
    );
  }
}
