abstract class TaskEvent {}

class LoadTasksEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String title;
  final String subtitle;

  AddTaskEvent(this.title, this.subtitle);
}
