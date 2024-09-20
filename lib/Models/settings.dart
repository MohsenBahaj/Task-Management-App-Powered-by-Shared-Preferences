class Settings {
  final Duration defaultNotificationTime;
  final TaskSortOrder taskSortOrder;

  Settings({
    required this.defaultNotificationTime,
    required this.taskSortOrder,
  });

  // Method to copy the current Settings object with modified fields
  Settings copyWith({
    Duration? defaultNotificationTime,
    TaskSortOrder? taskSortOrder,
  }) {
    return Settings(
      defaultNotificationTime:
          defaultNotificationTime ?? this.defaultNotificationTime,
      taskSortOrder: taskSortOrder ?? this.taskSortOrder,
    );
  }
}

enum TaskSortOrder {
  byDate,
  byTitle,
  byCompletionStatus,
}
