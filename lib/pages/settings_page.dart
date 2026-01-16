import 'package:app_template/data/constants.dart';
import 'package:app_template/data/shared_preferences/user_settings.dart';
import 'package:app_template/widgets/settings_button_widget.dart';
import 'package:app_template/widgets/toggle_button_widget.dart';
import 'package:app_template/widgets/user_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              UserDetailsWidget(
                firstName: "Vorname",
                lastName: "Nachname",
                email: "test@test.de",
              ),
              Divider(thickness: 2),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Appearance", style: NavigationTextStyle.titleText),
                  ValueListenableBuilder(
                    valueListenable: darkmodeNotifier,
                    builder: (context, isDarkMode, child) {
                      return ToggleButtonWidget(
                        value: isDarkMode,
                        icon: isDarkMode
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        title: isDarkMode ? "Lightmode" : "Darkmode",
                        onChanged: (value) async {
                          darkmodeNotifier.value = !darkmodeNotifier.value;
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool(
                            "userThemeKey",
                            darkmodeNotifier.value,
                          );
                        },
                      );
                    },
                  ),
                  SettingsButtonWidget(
                    icon: Icons.abc,
                    title: "test",
                    onTap: () {},
                  ),
                  SettingsButtonWidget(
                    icon: Icons.abc,
                    title: "test",
                    onTap: () {},
                  ),
                  Text("Contents", style: NavigationTextStyle.titleText),
                  SettingsButtonWidget(
                    icon: Icons.abc,
                    title: "test",
                    onTap: () {},
                  ),
                  Text(
                    "Privacy & Security",
                    style: NavigationTextStyle.titleText,
                  ),
                  SettingsButtonWidget(
                    icon: Icons.abc,
                    title: "test",
                    onTap: () {},
                  ),
                  SettingsButtonWidget(
                    icon: Icons.abc,
                    title: "test",
                    onTap: () {},
                  ),
                  Text("Storage", style: NavigationTextStyle.titleText),
                  SettingsButtonWidget(
                    icon: Icons.abc,
                    title: "test",
                    onTap: () {},
                  ),
                  Text("Miscellaneous", style: NavigationTextStyle.titleText),
                  SettingsButtonWidget(
                    icon: Icons.info_rounded,
                    title: "About",
                    onTap: () {},
                  ),
                  SettingsButtonWidget(
                    icon: Icons.house_rounded,
                    title: "Impressum",
                    onTap: () {},
                  ),
                  SettingsButtonWidget(
                    icon: Icons.logout_rounded,
                    title: "Logout",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
