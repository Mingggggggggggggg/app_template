import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

ValueNotifier<int> darkmodeNotifier = ValueNotifier(1);
ValueNotifier<int> seedColorNotifier = ValueNotifier(Colors.teal.toARGB32());

ValueNotifier<int> navBarPageNotifier = ValueNotifier(0);
