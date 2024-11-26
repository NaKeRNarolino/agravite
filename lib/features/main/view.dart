import 'package:agravite/widgets/nav.dart';
import 'package:flutter/material.dart';
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

        return Row(
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
      } else {
        return Placeholder();
      }
    }));
  }
}
