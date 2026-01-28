import 'package:app_template/data/classes/login_status_manager.dart';
import 'package:app_template/data/services/log_auth.dart';
import 'package:app_template/data/constants.dart';
import 'package:app_template/l10n/app_localizations.dart';
import 'package:app_template/widget_tree.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStatusManager _logStat = LoginStatusManager();

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerUsername = TextEditingController();
    controllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    controllerUsername.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void onSubmit() async {
    final success = await _logStat.login(
      controllerUsername.text,
      controllerPassword.text,
    );

    if (success && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WidgetTree()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _logStat,
      builder: (context, child) {
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
                    duration: const Duration(milliseconds: 150),
                    crossFadeState: _logStat.isLoading
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    sizeCurve: Curves.easeInOut,
                    firstChild: Column(
                      children: [
                        _logStat.errorMessage != null
                            ? SizedBox(
                                child: Text(
                                  _logStat.errorMessage!,
                                  style: AlertTextStyle.alertText,
                                ),
                              )
                            : SizedBox(height: 0),
                        TextField(
                          controller: controllerUsername,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: AppLocalizations.of(context)!.loginName,
                          ),
                        ),
                        SizedBox(height: 10, width: double.infinity),
                        TextField(
                          controller: controllerPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: AppLocalizations.of(context)!.password,
                          ),
                        ),
                      ],
                    ),
                    secondChild: SizedBox(width: double.infinity, height: 0),
                  ),

                  SizedBox(height: 20, width: double.infinity),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _logStat.isLoading ? null : onSubmit();
                      },
                      icon: _logStat.isLoading
                          ? Container(
                              width: 24,
                              height: 24,
                              padding: const EdgeInsets.all(2.0),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                          : Icon(Icons.login),
                      label: Text(AppLocalizations.of(context)!.login),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
