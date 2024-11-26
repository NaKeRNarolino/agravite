import 'package:flutter/material.dart';

class AgraviteContainer extends StatelessWidget {
  const AgraviteContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15.0)),
      child: child,
    );
  }
}
