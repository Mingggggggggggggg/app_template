import 'package:app_template/l10n/app_localizations.dart';
import 'package:app_template/pages/open_source_licenses_page/open_source_page.dart';
import 'package:app_template/widgets/Buttons/icon_detail_button_widget.dart';
import 'package:app_template/widgets/Buttons/user_details_widget.dart';
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
              Divider(),
              IconDetailButtonWidget(
                icon: Icons.mail,
                title: AppLocalizations.of(context)!.contact,
                subtitle: AppLocalizations.of(context)!.placeholder,
                onTap: () {},
              ),
              IconDetailButtonWidget(
                icon: Icons.all_inclusive_rounded,
                title: AppLocalizations.of(context)!.osLicense,
                subtitle: AppLocalizations.of(context)!.placeholder,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OpenSourcePage(),
                    ),
                  );
                },
              ),
              IconDetailButtonWidget(
                icon: Icons.bug_report,
                title: AppLocalizations.of(context)!.bugreport,
                subtitle: AppLocalizations.of(context)!.placeholder,
                onTap: () {},
              ),
              IconDetailButtonWidget(
                icon: Icons.home_work_outlined,
                title: AppLocalizations.of(context)!.imprint,
                subtitle: AppLocalizations.of(context)!.placeholder,
                onTap: () {},
              ),
              IconDetailButtonWidget(
                icon: Icons.phone_android,
                title: AppLocalizations.of(context)!.appversion,
                subtitle: AppLocalizations.of(context)!.placeholder,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
