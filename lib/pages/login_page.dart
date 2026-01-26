import 'package:app_template/l10n/app_localizations.dart';
import 'package:app_template/widget_tree.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "logo",
                child: Image.asset("assets/images/authorPB.png"),
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: AppLocalizations.of(context)!.loginName,
                      ),
                    ),
                    SizedBox(height: 20, width: double.infinity),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: AppLocalizations.of(context)!.password,
                      ),
                    ),
                  ],
                ),
                secondChild: SizedBox(width: double.infinity, height: 0),
                crossFadeState: CrossFadeState.showFirst,
                sizeCurve: Curves.easeInOut,
                duration: const Duration(milliseconds: 150),
              ),

              SizedBox(height: 40, width: double.infinity),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WidgetTree(),
                      ),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.login),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
