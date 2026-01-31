import 'package:app_template/l10n/app_localizations.dart';
import 'package:app_template/widgets/Buttons/icon_detail_button_widget.dart';
import 'package:flutter/material.dart';

class OpenSourcePage extends StatelessWidget {
  const OpenSourcePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.osLicense),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
        child: Column(
          children: [
            IconDetailButtonWidget(
              icon: Icons.code,
              title: AppLocalizations.of(context)!.placeholder,
              subtitle: AppLocalizations.of(context)!.placeholder,
              onTap: () {},
            ),
            IconDetailButtonWidget(
              icon: Icons.code,
              title: AppLocalizations.of(context)!.placeholder,
              subtitle: AppLocalizations.of(context)!.placeholder,
              onTap: () {},
            ),
            IconDetailButtonWidget(
              icon: Icons.code,
              title: AppLocalizations.of(context)!.placeholder,
              subtitle: AppLocalizations.of(context)!.placeholder,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
