import 'package:agravite/features/main/subfeatures/home/view.dart';
import 'package:agravite/features/main/subfeatures/settings/view.dart';
import 'package:agravite/features/main/view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: "/home", routes: [
  ShellRoute(
      builder: (context, state, child) => MainScreen(
            child: child,
          ),
      routes: [
        GoRoute(path: "/home", builder: (ctx, state) => Home()),
        GoRoute(path: "/settings", builder: (ctx, state) => Settings())
      ])
]);
