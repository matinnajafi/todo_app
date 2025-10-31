import 'package:hive/hive.dart';

part 'task_type_enum.g.dart';

@HiveType(typeId: 2)
enum TaskTypeEnum {
  @HiveField(0)
  work,

  @HiveField(1)
  personal,

  @HiveField(2)
  study,

  @HiveField(3)
  workout,

  @HiveField(4)
  meeting,

  @HiveField(5)
  shopping,

  @HiveField(6)
  meditate,

  @HiveField(7)
  banking,
}
