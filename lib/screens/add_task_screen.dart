import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manage/services/id_gen.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text(
          'Add Task',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        TextField(
          autofocus: true,
          controller: descriptionController,
          minLines: 3,
          maxLines: 5,
          decoration: const InputDecoration(
              label: Text('Description'), border: OutlineInputBorder()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            ElevatedButton(
                onPressed: () {
                  var task = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      id: getCustomUniqueId());
                  context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: const Text('Add'))
          ],
        ),
      ]),
    );
  }
}
