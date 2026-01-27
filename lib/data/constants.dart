import 'package:flutter/material.dart';

class MainTextStyle {
  static const TextStyle titleText = TextStyle(
    color: Colors.teal,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const descriptionText = TextStyle(fontSize: 15);
}

class NavigationTextStyle {
  static const TextStyle titleText = TextStyle(
    color: Colors.orange,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionText = TextStyle(fontSize: 18);
}

class AlertTextStyle {
  static const TextStyle alertText = TextStyle(
    color: Colors.redAccent,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
}

class UserThemeConstants {
  static const String userThemeKey = "userThemeKey";
  static const String userAmoledKey = "userAmoledKey";
  static const String userColorSeed = "userColorSeed";
  static const String userLocaleSetting = "userLocaleSetting";
}
