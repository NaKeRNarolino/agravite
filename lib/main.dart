import 'package:agravite/features/main/view.dart';
import 'package:agravite/router/router.dart';
import 'package:agravite/theme/dark_theme.dart';
import 'package:agravite/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: theme,
    );
  }
}
