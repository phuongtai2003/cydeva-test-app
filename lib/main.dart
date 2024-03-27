import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/di/di_config.dart';
import 'package:test_app/global_colors.dart';
import 'package:test_app/route_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      title: 'Flutter Demo',
      getPages: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: GlobalColors.iconColor,
        ),
        useMaterial3: true,
      ),
    );
  }
}
