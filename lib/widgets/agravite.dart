import 'package:agravite/models/profiles/profile.dart';
import 'package:agravite/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AgraviteButton extends StatelessWidget {
  AgraviteButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.horizontalPadding});

  AgraviteButton.label(
      {super.key,
      required String label,
      required this.onPressed,
      this.horizontalPadding}) {
    child = Text(
      label,
      style: TextStyle(fontFamily: inter, fontWeight: FontWeight.w700),
    );
  }

  late Widget child;
  final void Function() onPressed;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
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
          padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: horizontalPadding ?? 8.0))),
      child: child,
    );
  }
}

class AgraviteProfileButton extends StatelessWidget {
  const AgraviteProfileButton({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          onPressed: () {},
          style: ButtonStyle(
              shape: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered) ||
                    states.contains(WidgetState.pressed)) {
                  return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0));
                }
                return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0));
              }),
              backgroundColor:
                  WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
              foregroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.onPrimary),
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0))),
          child: Row(
            children: [
              Image.network(
                "https://art.pixilart.com/sr2b732d91f2f20.png",
                width: 32,
              ),
              const Gap(8.0),
              Text(profile.name),
            ],
          ),
        ),
        const Gap(8.0),
      ],
    );
  }
}

class AgraviteProfileGroupButton extends StatelessWidget {
  const AgraviteProfileGroupButton(
      {super.key, required this.profileGroup, this.leaveGap});

  final ProfileGroup profileGroup;
  final bool? leaveGap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 54.0,
          child: SubmenuButton(
            menuChildren: [
              ...profileGroup.profiles
                  .map((x) => AgraviteProfileButton(profile: x)),
              ...profileGroup.profileGroups
                  .map((x) => AgraviteProfileGroupButton(
                        profileGroup: x,
                        leaveGap: true,
                      ))
            ],
            style: ButtonStyle(
                shape: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.hovered) ||
                      states.contains(WidgetState.pressed)) {
                    return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0));
                  }
                  return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0));
                }),
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary),
                foregroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.onPrimary),
                padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 14.0))),
            menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary.withOpacity(0.3)),
                visualDensity: VisualDensity.standard,
                padding: const WidgetStatePropertyAll(EdgeInsets.all(8.0)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0))),
                surfaceTintColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.3))),
            child: Row(
              children: [
                Image.network(
                  "https://art.pixilart.com/sr2b732d91f2f20.png",
                  width: 32,
                  height: 32,
                ),
                const Gap(8.0),
                Expanded(
                    child: Text(
                  profileGroup.name,
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            ),
          ),
        ),
        if (leaveGap ?? false) Gap(8.0)
      ],
    );
  }
}
