import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar(
      {super.key,
      required this.extended,
      required this.onSelected,
      required this.selectedIndex});

  final bool extended;
  final void Function(int) onSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      destinations: const [
        NavigationRailDestination(icon: Icon(Icons.home), label: Text("Home")),
        NavigationRailDestination(
            icon: Icon(Icons.mode), label: Text("Profiles")),
        NavigationRailDestination(
            icon: Icon(Icons.cabin), label: Text("Versions")),
        NavigationRailDestination(
            icon: Icon(Icons.settings), label: Text("Settings"))
      ],
      selectedIndex: selectedIndex,
      extended: extended,
      backgroundColor: Colors.transparent,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      onDestinationSelected: onSelected,
    );
  }
}
