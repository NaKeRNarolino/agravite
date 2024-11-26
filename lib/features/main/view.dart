import 'dart:io';

import 'package:agravite/widgets/agravite_container.dart';
import 'package:agravite/widgets/nav.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.child});

  final Widget child;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (ctx, sizes) {
      if (sizes.maxWidth > 600) {
        final extended = sizes.maxWidth > 1400;

        final mainContent = Row(
          children: [
            Container(
                width: extended ? sizes.maxWidth * 0.115 : sizes.maxWidth * 0.1,
                margin: const EdgeInsets.all(24.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15.0)),
                child: NavBar(
                    extended: extended,
                    onSelected: (idx) {
                      setState(() {
                        selectedPageIndex = idx;
                        if (idx == 0) {
                          context.go("/home");
                        } else {
                          context.go("/settings");
                        }
                      });
                    },
                    selectedIndex: selectedPageIndex)),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(right: 24.0, bottom: 24.0, top: 24.0),
              child: widget.child,
            ))
          ],
        );

        if (Platform.isWindows) {
          return WindowBorder(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
            child: Column(
              children: [
                SizedBox(
                  height: 64,
                  child: WindowTitleBarBox(
                    child: MoveWindow(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 24, left: 24, right: 24, bottom: 0),
                        child: AgraviteContainer(child: Titlebar()),
                      ),
                    ),
                  ),
                ),
                Expanded(child: mainContent),
              ],
            ),
          );
        } else {
          return mainContent;
        }
      } else {
        return Placeholder();
      }
    }));
  }
}

class Titlebar extends StatelessWidget {
  const Titlebar({super.key});

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      fixedSize: const WidgetStatePropertyAll(Size.fromWidth(10)),
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      shape: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed) ||
            states.contains(WidgetState.focused)) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0));
        }
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0));
      }),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/svgs/Agravite.svg",
          height: 30,
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary, BlendMode.srcATop),
        ),
        // Expanded(child: MoveWindow()),
        Row(
          children: [
            FilledButton(
              onPressed: () {
                appWindow.minimize();
              },
              style: style,
              child: const Icon(Icons.minimize),
            ),
            const Gap(8.0),
            FilledButton(
              onPressed: () {
                appWindow.maximizeOrRestore();
              },
              style: style,
              child: const Icon(Icons.expand),
            ),
            const Gap(8.0),
            FilledButton(
              onPressed: () {
                appWindow.close();
              },
              style: style.copyWith(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed) ||
                      states.contains(WidgetState.hovered) ||
                      states.contains(WidgetState.focused)) {
                    return Theme.of(context).colorScheme.tertiary;
                  }
                  return Theme.of(context).colorScheme.primary;
                }),
              ),
              child: const Icon(Icons.close),
            ),
          ],
        )
      ],
    );
  }
}
