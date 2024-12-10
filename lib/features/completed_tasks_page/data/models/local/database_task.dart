import 'package:hive/hive.dart';
import 'package:kamban/features/board_page/domain/entities/section.dart';
import 'package:kamban/features/board_page/domain/entities/task.dart';

part 'database_task.g.dart';

@HiveType(typeId: 0)
class DatabaseTask extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final DatabaseSectionType sectionType;

  @HiveField(4)
  final String sectionId;

  @HiveField(5)
  final int timeSpent;

  @HiveField(6)
  final bool isTiming;

  DatabaseTask({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.sectionType,
    required this.timeSpent,
    required this.isTiming,
    required this.sectionId,
  });

  factory DatabaseTask.fromTask(Task task) {
    return DatabaseTask(
      id: task.id,
      content: task.content,
      createdAt: task.createdAt,
      sectionType: _mapSectionTypeToDatabaseSectionType(task.sectionType),
      sectionId: task.sectionId,
      timeSpent: task.timeSpent,
      isTiming: task.isTiming,
    );
  }

  Task toTask() {
    return Task(
      id: id,
      content: content,
      createdAt: createdAt,
      sectionType: _mapDatabaseSectionTypeToSectionType(sectionType),
      sectionId: sectionId,
      timeSpent: timeSpent,
      isTiming: isTiming,
    );
  }

  static DatabaseSectionType _mapSectionTypeToDatabaseSectionType(SectionType sectionType) {
    switch (sectionType) {
      case SectionType.toDo:
        return DatabaseSectionType.toDo;
      case SectionType.inProgress:
        return DatabaseSectionType.inProgress;
      case SectionType.done:
        return DatabaseSectionType.done;
      default:
        throw Exception('Unknown SectionType: $sectionType');
    }
  }

  static SectionType _mapDatabaseSectionTypeToSectionType(DatabaseSectionType sectionType) {
    switch (sectionType) {
      case DatabaseSectionType.toDo:
        return SectionType.toDo;
      case DatabaseSectionType.inProgress:
        return SectionType.inProgress;
      case DatabaseSectionType.done:
        return SectionType.done;
      default:
        throw Exception('Unknown DatabaseSectionType: $sectionType');
    }
  }
}

@HiveType(typeId: 1)
enum DatabaseSectionType {
  @HiveField(0)
  toDo,
  @HiveField(1)
  inProgress,
  @HiveField(2)
  done,
}
