import 'package:hive/hive.dart';
import 'package:kamban/features/board_page/data/models/local/database_task.dart';
import 'package:kamban/features/completed_tasks_page/domain/repositories/repository.dart';

class CompletedTaskRepositoryImpl extends CompletedTaskRepository {
  final Box<DatabaseTask> completedTasksBox;

  CompletedTaskRepositoryImpl(this.completedTasksBox);

  @override
  List<DatabaseTask> getCompletedTasks() {
    return completedTasksBox.values.toList();
  }
}
