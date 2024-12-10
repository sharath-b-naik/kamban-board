// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseTaskAdapter extends TypeAdapter<DatabaseTask> {
  @override
  final int typeId = 0;

  @override
  DatabaseTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabaseTask(
      id: fields[0] as String,
      content: fields[1] as String,
      createdAt: fields[2] as DateTime,
      sectionType: fields[3] as DatabaseSectionType,
      timeSpent: fields[5] as int,
      isTiming: fields[6] as bool,
      sectionId: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DatabaseTask obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.sectionType)
      ..writeByte(4)
      ..write(obj.sectionId)
      ..writeByte(5)
      ..write(obj.timeSpent)
      ..writeByte(6)
      ..write(obj.isTiming);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DatabaseSectionTypeAdapter extends TypeAdapter<DatabaseSectionType> {
  @override
  final int typeId = 1;

  @override
  DatabaseSectionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DatabaseSectionType.toDo;
      case 1:
        return DatabaseSectionType.inProgress;
      case 2:
        return DatabaseSectionType.done;
      default:
        return DatabaseSectionType.toDo;
    }
  }

  @override
  void write(BinaryWriter writer, DatabaseSectionType obj) {
    switch (obj) {
      case DatabaseSectionType.toDo:
        writer.writeByte(0);
        break;
      case DatabaseSectionType.inProgress:
        writer.writeByte(1);
        break;
      case DatabaseSectionType.done:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseSectionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
