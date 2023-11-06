// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:task_manage/blocs/bloc_exports.dart';
import 'package:task_manage/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)..add(event.task),
      removedTasks: state.removedTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completeTasks = state.completeTasks;

    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completeTasks = List.from(completeTasks)
              ..insert(0, task.copyWith(isDone: true))
          }
        : {
            completeTasks = List.from(completeTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDone: false))
          };
    emit(TasksState(
      pendingTasks: pendingTasks,
      completeTasks: completeTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: state.pendingTasks, completeTasks: state.completeTasks, 
        removedTasks: List.from(state.removedTasks)..remove(event.task)));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)..remove(event.task),
      completeTasks: List.from(state.completeTasks)..remove(event.task),
      removedTasks: List.from(state.removedTasks)
        ..add(event.task.copyWith(isDeleted: true)),
    ));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
    //throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
    //throw UnimplementedError();
  }
}
