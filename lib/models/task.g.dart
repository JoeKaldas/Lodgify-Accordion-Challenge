// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      description: json['description'] as String?,
      name: json['name'] as String?,
      value: json['value'] as int,
      checked: json['checked'] as bool,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'value': instance.value,
      'checked': instance.checked,
    };
