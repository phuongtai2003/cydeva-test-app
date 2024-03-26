import 'package:flutter/material.dart';
import 'package:test_app/screens/flash/flash_screen.dart';
import 'package:test_app/screens/login/login_screen.dart';
import 'package:test_app/screens/login/otp_screen.dart';
import 'package:test_app/screens/login/success_screen.dart';
import 'package:test_app/screens/main/main_screen.dart';

class RouteGenerator {
  static const String login = '/login';
  static const String otp = '/otp';
  static const String main = '/';
  static const String home = '/home';
  static const String success = '/success';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const FlashScreen(),
        );
      case main:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MainScreen(),
        );
      case login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case otp:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OtpScreen(),
        );
      case success:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SuccessScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'No route founded',
              ),
            ),
          ),
        );
    }
  }
}
