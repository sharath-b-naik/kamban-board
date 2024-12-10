import 'package:kamban/features/board_page/data/models/local/database_task.dart';

abstract class CompletedTaskRepository {
  List<DatabaseTask> getCompletedTasks();
}
