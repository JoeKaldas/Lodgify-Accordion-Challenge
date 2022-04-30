import 'package:lodgify/utils/consts.dart';

import '../models/task.dart';
import '../models/task_group.dart';

class Parser {
  static dynamic parse<T>(Map<String, dynamic> json) {
    switch (T) {
      case TaskGroup:
        return TaskGroup.fromJson(json);
      case Task:
        return Task.fromJson(json);
      case String:
        return json.toString();
      default:
        return json;
    }
  }
}
