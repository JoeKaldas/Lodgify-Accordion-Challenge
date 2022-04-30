import 'package:json_annotation/json_annotation.dart';
import 'task.dart';

part 'task_group.g.dart';

@JsonSerializable()
class TaskGroup {
  late String name;
  late List<Task> tasks;
  @JsonKey(ignore: true)
  bool isExpanded = false;

  TaskGroup({
    required this.name,
    required this.tasks,
  });

  bool get allTasksChecked {
    return tasks.every((t) => t.checked);
  }

  factory TaskGroup.fromJson(Map<String, dynamic> json) =>
      _$TaskGroupFromJson(json);

  Map<String, dynamic> toJson() => _$TaskGroupToJson(this);
}
