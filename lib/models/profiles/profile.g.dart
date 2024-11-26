// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      versionUuid: json['versionUuid'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'versionUuid': instance.versionUuid,
      'name': instance.name,
      'icon': instance.icon,
    };

ProfileGroup _$ProfileGroupFromJson(Map<String, dynamic> json) => ProfileGroup(
      name: json['name'] as String,
      icon: json['icon'] as String,
      profiles: (json['profiles'] as List<dynamic>)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileGroups: (json['profileGroups'] as List<dynamic>)
          .map((e) => ProfileGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileGroupToJson(ProfileGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'profiles': instance.profiles,
      'profileGroups': instance.profileGroups,
    };
