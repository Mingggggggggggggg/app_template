import 'package:app_template/data/constants.dart';
import 'package:app_template/l10n/app_localizations.dart';
import 'package:app_template/main.dart';
import 'package:app_template/pages/about_page.dart';
import 'package:app_template/pages/login_page.dart';
import 'package:app_template/widgets/Dropdown%20Menu%20Select/dropdown_button_widget.dart';
import 'package:app_template/widgets/color_picker_dialog_widget.dart';
import 'package:app_template/widgets/settings_button_widget.dart';
import 'package:app_template/widgets/toggle_button_widget.dart';
import 'package:app_template/widgets/user_details_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Standardwerte, Instanziierungen
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: Listenable.merge([themeManager, localeManager]),
        builder: (context, child) {
          final currentCode = localeManager.locale.languageCode.toUpperCase();
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  UserDetailsWidget(
                    firstName: "Vorname",
                    lastName: "Nachname",
                    email: "test@test.de",
                    avatar: NetworkImage("https://picsum.photos/200"),
                  ),
                  Divider(thickness: 2),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.appearance,
                        style: NavigationTextStyle.titleText,
                      ),
                      ToggleButtonWidget(
                        value: themeManager.isDarkMode,
                        icon: themeManager.isDarkMode
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        title: themeManager.isDarkMode
                            ? AppLocalizations.of(context)!.lightmode
                            : AppLocalizations.of(context)!.darkmode,
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
                            icon: Icons.contrast_rounded,
                            title: AppLocalizations.of(context)!.amoled,
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
                        title: AppLocalizations.of(context)!.colorpicker,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ColorPickerDialogWidget(
                                currentColor: themeManager.seedColor,
                                selectedColor: (value) {
                                  themeManager.setColorSeed(value);
                                },
                              );
                            },
                          );
                        },
                      ),
                      Text(
                        AppLocalizations.of(context)!.contents,
                        style: NavigationTextStyle.titleText,
                      ),
                      SettingsButtonWidget(
                        icon: Icons.view_stream,
                        title: AppLocalizations.of(context)!.cardSize,
                        onTap: () {},
                      ),
                      Text(
                        AppLocalizations.of(context)!.privacyAndSecurity,
                        style: NavigationTextStyle.titleText,
                      ),
                      SettingsButtonWidget(
                        icon: Icons.abc,
                        title: AppLocalizations.of(context)!.placeholder,
                        onTap: () {},
                      ),
                      SettingsButtonWidget(
                        icon: Icons.abc,
                        title: AppLocalizations.of(context)!.placeholder,
                        onTap: () {},
                      ),
                      Text(
                        AppLocalizations.of(context)!.storage,
                        style: NavigationTextStyle.titleText,
                      ),
                      SettingsButtonWidget(
                        icon: Icons.abc,
                        title: AppLocalizations.of(context)!.placeholder,
                        onTap: () {},
                      ),
                      Text(
                        AppLocalizations.of(context)!.miscellaneous,
                        style: NavigationTextStyle.titleText,
                      ),
                      DropdownButtonWidget(
                        icon: Icons.language,
                        title: AppLocalizations.of(context)!.language,
                        itemList: AppLocalizations.supportedLocales
                            .map((e) => e.languageCode)
                            .toList(),
                        currentValue: currentCode,
                        onChanged: (value) {
                          localeManager.changeLocale(value);
                        },
                      ),
                      SettingsButtonWidget(
                        icon: Icons.info_rounded,
                        title: AppLocalizations.of(context)!.about,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AboutPage(),
                            ),
                          );
                        },
                      ),
                      SettingsButtonWidget(
                        icon: Icons.logout_rounded,
                        title: AppLocalizations.of(context)!.logout,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
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
