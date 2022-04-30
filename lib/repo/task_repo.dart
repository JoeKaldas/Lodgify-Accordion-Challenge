import 'package:lodgify/base/base_repo.dart';
import 'package:lodgify/models/task_group.dart';
import 'package:lodgify/network/endpoints.dart';

class TaskRepo extends BaseRepo {
  Future<List<TaskGroup>> getTasks() {
    return networkManager.getList<TaskGroup>(
      Endpoints.tasksURL,
    );
  }
}
