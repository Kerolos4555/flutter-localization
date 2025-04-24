import 'package:flutter/material.dart';
import 'package:flutter_localization/pages/about_page.dart';
import 'package:flutter_localization/pages/home_page.dart';
import 'package:flutter_localization/pages/settings_page.dart';
import 'package:flutter_localization/routes/route_constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (context) => const AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (context) => const SettingsPage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
