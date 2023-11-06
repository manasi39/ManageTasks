part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completeTasks;
  final List<Task> removedTasks;

  const TasksState( 
      {this.pendingTasks = const <Task>[], this.completeTasks = const <Task>[],  this.removedTasks = const <Task>[]});

  @override
  List<Object> get props => [pendingTasks, removedTasks,removedTasks];

  Map<String, dynamic> toMap() {
    return {
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'completeTasks': completeTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
        pendingTasks: List<Task>.from(map['pendingTasks']?.map((x) => Task.fromMap(x))),
        completeTasks:
            List<Task>.from(map['completeTasks']?.map((x) => Task.fromMap(x))),
        removedTasks:
            List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x))));
  }
}
