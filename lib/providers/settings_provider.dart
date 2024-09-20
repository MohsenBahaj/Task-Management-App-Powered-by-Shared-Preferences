import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/Models/settings.dart';

class SettingsNotifier extends StateNotifier<Settings> {
  SettingsNotifier()
      : super(Settings(
          defaultNotificationTime: Duration(minutes: 30),
          taskSortOrder: TaskSortOrder.byDate,
        ));

  // Update notification time
  void updateNotificationTime(Duration newTime) {
    state = state.copyWith(defaultNotificationTime: newTime);
  }

  // Update task sorting order
  void updateTaskSortOrder(TaskSortOrder newOrder) {
    state = state.copyWith(taskSortOrder: newOrder);
  }
}
