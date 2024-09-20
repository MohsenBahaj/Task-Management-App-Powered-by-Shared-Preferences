import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/Models/task_model.dart';
import 'package:tasks/notifications/main_file.dart';

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>(
  (ref) => TaskListNotifier(),
);

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super([]) {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('tasks') ?? '[]';
    final List<dynamic> jsonList = json.decode(jsonString);

    state = jsonList.map((json) => Task.fromJson(json)).toList();
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = state.map((task) => task.toJson()).toList();
    final jsonString = json.encode(jsonList);
    await prefs.setString('tasks', jsonString);
  }

  void addTask(Task task) {
    state = [...state, task];
    _saveTasks();
    // if (task.reminderTime != null) {
    //   scheduleNotification(task.reminderTime!, task.title);
    // }
  }

  void updateTask(String id, Task updatedTask) {
    state = [
      for (final task in state)
        if (task.id == id) updatedTask else task,
    ];
    _saveTasks();
    // if (updatedTask.reminderTime != null) {
    //   scheduleNotification(updatedTask.reminderTime!, updatedTask.title);
    // }
  }

  void removeTask(String id) {
    state = state.where((task) => task.id != id).toList();
    _saveTasks();
  }

  void toggleTaskCompletion(String id) {
    state = [
      for (final task in state)
        if (task.id == id)
          task.copyWith(isCompleted: !task.isCompleted)
        else
          task,
    ];
    _saveTasks();
  }
}
