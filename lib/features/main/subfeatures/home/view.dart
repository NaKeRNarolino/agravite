import 'package:agravite/models/profiles/profile.dart';
import 'package:agravite/widgets/agravite.dart';
import 'package:agravite/widgets/agravite_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return AgraviteContainer(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: AgraviteContainer(child: Toolbar())),
                ],
              ),
              const Gap(8.0),
              Expanded(
                child: SizedBox.expand(
                  child: AgraviteContainer(
                      child: ClipRRect(
                    child: Image.network(
                      "https://static0.gamerantimages.com/wordpress/wp-content/uploads/2024/10/minecraft-caves-and-cliffs-update-official-artwork.jpg",
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  )),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 140,
                height: 100,
                child: AgraviteProfileGroupButton(
                    profileGroup: ProfileGroup(
                        name: "Hello!",
                        profiles: [
                          Profile(
                              versionUuid: "undef",
                              name: "undef1",
                              icon: "undef")
                        ],
                        icon: "Undef",
                        profileGroups: [
                          ProfileGroup(
                              name: "Hello!",
                              profiles: [
                                Profile(
                                    versionUuid: "undef",
                                    name: "undef1",
                                    icon: "undef")
                              ],
                              icon: "Undef",
                              profileGroups: [
                                ProfileGroup(
                                    name: "Hello!",
                                    profiles: [
                                      Profile(
                                          versionUuid: "undef",
                                          name: "undef1",
                                          icon: "undef")
                                    ],
                                    icon: "Undef",
                                    profileGroups: []),
                                ProfileGroup(
                                    name: "Hello!",
                                    profiles: [
                                      Profile(
                                          versionUuid: "undef",
                                          name: "undef1",
                                          icon: "undef")
                                    ],
                                    icon: "Undef",
                                    profileGroups: [
                                      ProfileGroup(
                                          name: "Hello!",
                                          profiles: [
                                            Profile(
                                                versionUuid: "undef",
                                                name: "undef1",
                                                icon: "undef")
                                          ],
                                          icon: "Undef",
                                          profileGroups: [])
                                    ])
                              ])
                        ])),
              ),
              Gap(8.0),
              Column(
                children: [
                  Expanded(
                      child: AgraviteButton.label(
                    label: "LAUNCH!",
                    onPressed: () {},
                    horizontalPadding: 48,
                  ))
                ],
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                  child: AgraviteButton(
                onPressed: () {},
                horizontalPadding: 12,
                child: Icon(Icons.settings_outlined),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
