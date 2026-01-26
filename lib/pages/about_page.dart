import 'package:app_template/l10n/app_localizations.dart';
import 'package:app_template/widgets/icon_detail_button_widget.dart';
import 'package:app_template/widgets/settings_button_widget.dart';
import 'package:app_template/widgets/user_details_widget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.about),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: Column(
            children: [
              UserDetailsWidget(
                firstName: "Mingggggggggggggg",
                lastName: "",
                email: "Autor",
                avatar: AssetImage("assets/images/authorPB.png"),
              ),
              UserDetailsWidget(
                firstName: "Autor 2",
                lastName: "",
                email: "Co-Autor",
                avatar: AssetImage("assets/images/authorPB.png"),
              ),
              IconDetailButtonWidget(
                icon: Icons.mail,
                title: "Kontakt",
                subtitle: "mailadresse",
                onTap: () {},
              ),
              IconDetailButtonWidget(
                icon: Icons.bug_report,
                title: "Bugreport",
                subtitle: "mailadresse",
                onTap: () {},
              ),
              IconDetailButtonWidget(
                icon: Icons.phone_android,
                title: "Appversion",
                subtitle: "Version 0.0.1",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
