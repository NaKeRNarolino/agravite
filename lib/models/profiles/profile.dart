import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final String versionUuid;
  final String name;
  final String icon;

  Profile({required this.versionUuid, required this.name, required this.icon});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class ProfileGroup {
  final String name;
  final String icon;
  final List<Profile> profiles;
  final List<ProfileGroup> profileGroups;

  ProfileGroup(
      {required this.name,
      required this.icon,
      required this.profiles,
      required this.profileGroups});

  factory ProfileGroup.fromJson(Map<String, dynamic> json) =>
      _$ProfileGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileGroupToJson(this);
}
