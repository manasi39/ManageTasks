// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:task_manage/blocs/bloc_exports.dart';
import 'package:task_manage/models/task.dart';
import 'package:task_manage/widgets/tasks_list.dart';

class PendingScreen extends StatelessWidget {
  PendingScreen({Key? key}) : super(key: key);
  static const id='task_screen';
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.pendingTasks.length} Pending | ${state.completeTasks.length} Completed',
                  ),
                ),
              ),
              TaskList(tasksList: tasksList)
            ],
          );
          
  });
      }
    
}
