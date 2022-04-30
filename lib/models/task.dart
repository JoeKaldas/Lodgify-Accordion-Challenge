import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable(explicitToJson: true)
class Task {
  //
  late String? description;
  late String? name;
  late int value;
  late bool checked;

  Task({
    required this.description,
    required this.name,
    required this.value,
    required this.checked,
  });

  // Return description first if present then name if present then empty string
  String get taskName {
    return description ?? name ?? '';
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
