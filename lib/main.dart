import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/global_colors.dart';
import 'package:test_app/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: GlobalColors.iconColor,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      initialRoute: RouteGenerator.main,
    );
  }
}
