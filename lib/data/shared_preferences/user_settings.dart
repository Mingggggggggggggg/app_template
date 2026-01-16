import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

ValueNotifier<bool> darkmodeNotifier = ValueNotifier(false);
ValueNotifier<int> seedColorNotifier = ValueNotifier(Colors.teal.toARGB32());

ValueNotifier<int> navBarPageNotifier = ValueNotifier(0);
