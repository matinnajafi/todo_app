import 'package:bloc/bloc.dart';
import 'package:todo_app/data/services/task_services.dart';

import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskService taskService;

  TaskBloc(this.taskService) : super(TaskInitial()) {
    on<LoadTasksEvent>((event, emit) {
      emit(TaskLoading());
      try {
        final tasks = taskService.getAllTasks();
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError('Failed to load tasks'));
      }
    });

    on<AddTaskEvent>((event, emit) {
      taskService.addTask(title: event.title, subtitle: event.subtitle);
      add(LoadTasksEvent()); // refresh list
    });
  }
}
