import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/providers/nav_provider.dart';
import 'package:tasks/providers/screens/taskDetails.dart';
import 'package:tasks/providers/tasks_provider.dart'; // Import the provider
import 'package:tasks/widgets/add_task_dialog.dart';
import 'package:tasks/widgets/update_task_dialog.dart';
import 'package:tasks/widgets/bottom_navbar.dart';

class TaskListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int i = ref.watch(navBarProvider);
    final taskList = ref.watch(taskListProvider).where((task) {
      if (i == 1) {
        return task.isCompleted; // Show only completed tasks
      } else if (i == 2) {
        return !task.isCompleted; // Show only pending tasks
      }
      return true; // Show all tasks for index 0
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text('Task Management'),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddTaskDialog();
            },
          );
        },
        label: Text('Add Task'),
        icon: Icon(Icons.add),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: taskList.isEmpty
            ? Center(child: Text('No tasks found.'))
            : ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  final task = taskList[index];
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return TaskDetails(
                              task: task,
                            );
                          });
                    },
                    child: Card(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      child: ListTile(
                        textColor:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                        title: Text(task.title),
                        subtitle: Text(task.description ?? 'No description'),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return UpdateTaskDialog(task: task);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
