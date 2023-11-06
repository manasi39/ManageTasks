import 'package:flutter/material.dart';
import 'package:task_manage/blocs/bloc_exports.dart';
import 'package:task_manage/blocs/switch_bloc/switch_bloc.dart';
import 'package:task_manage/screens/recycle_bin.dart';
import 'package:task_manage/screens/tabs_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: Color.fromARGB(255, 163, 221, 216),
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineSmall,
              )),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text('${state.pendingTasks.length} | ${state.completeTasks.length}'),
                ),
              );
            },
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                ),
              );
            },
          ),

          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                  value: state.switchVal,
                  onChanged: (value) {
                    value
                        ? context.read()<SwitchBloc>().add(SwitchOn())
                        : context.read()<SwitchBloc>().add(SwitchOff());
                  });
            },
          ),
        ],
      )),
    );
  }
}
