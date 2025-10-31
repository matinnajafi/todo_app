import 'package:hive/hive.dart';
import 'package:todo_app/data/models/task_type.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  Task({
    required this.title,
    required this.subtitle,
    this.isDone = false,
    required this.time,
    required this.taskType,
    required this.isNotifOn,
  });

  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  @HiveField(2)
  bool isDone;

  @HiveField(3)
  DateTime time;

  @HiveField(4)
  TaskType taskType;

  @HiveField(5)
  bool isNotifOn;
}
