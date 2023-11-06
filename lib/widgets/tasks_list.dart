import 'package:flutter/material.dart';
import 'package:task_manage/models/task.dart';
import 'package:task_manage/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
            children: tasksList
                .map((task) => ExpansionPanelRadio(
                      value: task.id,
                      headerBuilder: (context, isOpen) => TaskTile(task: task),
                      body: ListTile(
                          title: SelectableText.rich(TextSpan(children: [
                        const TextSpan(
                          text: 'Description: \n',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                            text: task.description,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 96, 114, 123))),
                      ]))),
                    ))
                .toList()),
      ),
    );
  }
}


// Expanded(
//       child: ListView.builder(
//           itemCount: tasksList.length,
//           itemBuilder: (context, index) {
//             var task = tasksList[index];
//             return TaskTile(task: task);
//           }),
//     );