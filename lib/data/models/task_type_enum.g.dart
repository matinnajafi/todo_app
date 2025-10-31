// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTypeEnumAdapter extends TypeAdapter<TaskTypeEnum> {
  @override
  final int typeId = 2;

  @override
  TaskTypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskTypeEnum.work;
      case 1:
        return TaskTypeEnum.personal;
      case 2:
        return TaskTypeEnum.study;
      case 3:
        return TaskTypeEnum.workout;
      case 4:
        return TaskTypeEnum.meeting;
      case 5:
        return TaskTypeEnum.shopping;
      case 6:
        return TaskTypeEnum.meditate;
      case 7:
        return TaskTypeEnum.banking;
      default:
        return TaskTypeEnum.work;
    }
  }

  @override
  void write(BinaryWriter writer, TaskTypeEnum obj) {
    switch (obj) {
      case TaskTypeEnum.work:
        writer.writeByte(0);
        break;
      case TaskTypeEnum.personal:
        writer.writeByte(1);
        break;
      case TaskTypeEnum.study:
        writer.writeByte(2);
        break;
      case TaskTypeEnum.workout:
        writer.writeByte(3);
        break;
      case TaskTypeEnum.meeting:
        writer.writeByte(4);
        break;
      case TaskTypeEnum.shopping:
        writer.writeByte(5);
        break;
      case TaskTypeEnum.meditate:
        writer.writeByte(6);
        break;
      case TaskTypeEnum.banking:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
