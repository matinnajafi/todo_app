import 'package:hive/hive.dart';
import 'package:todo_app/core/constants/hive_box_names.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/data/models/task_type.dart';
import 'package:todo_app/data/models/task_type_enum.dart';

class TaskService {
  final Box<Task> _taskBox = Hive.box<Task>(taskBoxName);

  void addTask({
    required String title,
    required String subtitle,
    TaskTypeEnum type = TaskTypeEnum.work,
  }) {
    final newTask = Task(
      title: title,
      subtitle: subtitle,
      time: DateTime.now(),
      taskType: TaskType(
        image: 'images/work_man.png',
        title: type.name,
        taskTypeEnum: type,
      ),
      isNotifOn: false,
    );

    _taskBox.add(newTask);
  }

  List<Task> getAllTasks() => _taskBox.values.toList();

  void deleteTask(int index) => _taskBox.deleteAt(index);

  void updateTask(int index, Task updatedTask) =>
      _taskBox.putAt(index, updatedTask);

  Task? getTask(int index) => _taskBox.getAt(index);
}
