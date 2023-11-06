// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:task_manage/blocs/bloc_exports.dart';
import 'package:task_manage/models/task.dart';
import 'package:task_manage/widgets/tasks_list.dart';

class CompletedScreen extends StatelessWidget {
  CompletedScreen({Key? key}) : super(key: key);
  static const id='task_screen';

  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completeTasks;
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${tasksList.length} Tasks',
                  ),
                ),
              ),
              TaskList(tasksList: tasksList)
            ],
          );
          
  });
      }
    
}
