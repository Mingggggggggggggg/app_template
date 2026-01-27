import 'package:app_template/data/classes/login_manager.dart';
import 'package:app_template/data/constants.dart';
import 'package:app_template/l10n/app_localizations.dart';
import 'package:app_template/widget_tree.dart';
import 'package:flutter/material.dart';

final loginManager = LoginManager();

String? errorMessage;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  bool _isLoading = false;

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

  void onSubmit() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        errorMessage = "Invalid Login credentials";
      });
    });
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
                    errorMessage != null
                        ? SizedBox(
                            child: Text(
                              errorMessage!,
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
                secondChild: Column(
                  children: [
                    SizedBox(width: double.infinity, height: 0),
                    Text("Status Textbox", style: AlertTextStyle.alertText),
                  ],
                ),
                crossFadeState: _isLoading
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                sizeCurve: Curves.easeInOut,
                duration: const Duration(milliseconds: 150),
              ),

              SizedBox(height: 20, width: double.infinity),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _isLoading ? null : onSubmit();
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const WidgetTree(),
                    //   ),
                    // );
                  },
                  icon: _isLoading
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
  }
}
