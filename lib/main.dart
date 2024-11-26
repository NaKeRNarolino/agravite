import 'dart:io';

import 'package:agravite/features/main/view.dart';
import 'package:agravite/router/router.dart';
import 'package:agravite/theme/dark_theme.dart';
import 'package:agravite/theme/theme.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());

  if (Platform.isWindows) {
    doWhenWindowReady(() {
      const initialSize = Size(1200, 850);
      appWindow.minSize = const Size(700, 500);
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
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
