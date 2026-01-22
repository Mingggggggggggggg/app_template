import 'package:app_template/data/constants.dart';
import 'package:app_template/main.dart';
import 'package:app_template/widgets/settings_button_widget.dart';
import 'package:app_template/widgets/toggle_button_widget.dart';
import 'package:app_template/widgets/user_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: themeManager,
        builder: (context, child) {
          return SingleChildScrollView(
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
                      ToggleButtonWidget(
                        value: themeManager.isDarkMode,
                        icon: themeManager.isDarkMode
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        title: themeManager.isDarkMode
                            ? "Lightmode"
                            : "Darkmode",
                        onChanged: (value) async {
                          themeManager.setTheme(value);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsetsGeometry.directional(
                          start: 20,
                        ),
                        child: AnimatedCrossFade(
                          alignment: Alignment.topCenter,
                          duration: const Duration(milliseconds: 150),
                          firstChild: SizedBox(
                            width: double.infinity,
                            height: 0,
                          ),
                          secondChild: ToggleButtonWidget(
                            icon: Icons.lightbulb_sharp,
                            title: "Amoled",
                            value: themeManager.isAmoled,
                            onChanged: (value) async {
                              themeManager.setAmoled(value);
                            },
                          ),
                          crossFadeState: !themeManager.isDarkMode
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          sizeCurve: Curves.easeInOut,
                        ),
                      ),
                      SettingsButtonWidget(
                        icon: Icons.palette_rounded,
                        title: "Farbpalette",
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
                      Text(
                        "Miscellaneous",
                        style: NavigationTextStyle.titleText,
                      ),
                      SettingsButtonWidget(
                        icon: Icons.language,
                        title: "Sprache",
                        onTap: () {
                          //TODO Sprache
                        },
                      ),
                      SettingsButtonWidget(
                        icon: Icons.info_rounded,
                        title: "About",
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
          );
        },
      ),
    );
  }
}
