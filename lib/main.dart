import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explorer/ui/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Explorer',
      theme: FlexThemeData.light(scheme: FlexScheme.bigStone),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.bigStone),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
