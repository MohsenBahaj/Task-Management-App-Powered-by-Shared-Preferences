import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/Models/task_model.dart';
import 'package:tasks/providers/tasks_provider.dart';
import 'package:tasks/widgets/date_time_utils.dart';
import 'package:tasks/widgets/utility.dart'; // Adjust import

class AddTaskDialog extends ConsumerStatefulWidget {
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends ConsumerState<AddTaskDialog> {
  late DateTime _dueDate;
  late TimeOfDay _reminderTime;
  bool _isCompleted = false;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dueDate = DateTime.now();
    _reminderTime = TimeOfDay.now();
  }

  Future<void> _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null && selectedDate != _dueDate) {
      setState(() {
        _dueDate = selectedDate;
      });
    }
  }

  Future<void> _selectTime() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: _reminderTime,
    );
    if (selectedTime != null && selectedTime != _reminderTime) {
      setState(() {
        _reminderTime = selectedTime;
      });
    }
  }

  void _addTask() {
    final task = Task(
      id: DateTime.now().toString(), // Unique ID generation
      title: _titleController.text,
      description: _descriptionController.text,
      dueDate: _dueDate,
      reminderTime: combineDateTime(_dueDate, _reminderTime),
      isCompleted: _isCompleted,
    );

    ref.read(taskListProvider.notifier).addTask(task);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 3,
          ),
          Row(
            children: [
              Text('Due Date: ${formatDate(_dueDate)}'),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: _selectDate,
              ),
            ],
          ),
          Row(
            children: [
              Text('Reminder Time: ${formatTime(_reminderTime)}'),
              IconButton(
                icon: Icon(Icons.access_time),
                onPressed: _selectTime,
              ),
            ],
          ),
          CheckboxListTile(
            title: Text('Completed'),
            value: _isCompleted,
            onChanged: (value) {
              setState(() {
                _isCompleted = value!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: _addTask,
          child: Text('Add Task'),
        ),
      ],
    );
  }
}
