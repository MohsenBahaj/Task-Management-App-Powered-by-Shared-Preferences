import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasks/Models/task_model.dart';
import 'package:tasks/widgets/utility.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(task.title),
      contentPadding: EdgeInsets.all(20),
      backgroundColor: Colors.grey[200], // Light grey to mimic paper
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey, width: 1), // Border like a receipt
      ),
      content: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align content to the left
        mainAxisSize: MainAxisSize.min, // Take minimum vertical space
        children: [
          _buildTaskDetailRow(
              'Description', task.description ?? 'No description'),
          SizedBox(height: 10),
          _buildTaskDetailRow('Due Date', formatDate(task.dueDate)),
          SizedBox(height: 10),
          _buildTaskDetailRow(
              'Status', task.isCompleted ? 'Completed' : 'Pending'),
          SizedBox(height: 10),
          _buildTaskDetailRow('Reminder Time',
              formatTimeForDetails(task.reminderTime!) ?? 'No reminder'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Okay'),
        ),
      ],
    );
  }
}

Widget _buildTaskDetailRow(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
      ),
      Text(
        value,
        style: TextStyle(color: Colors.black54),
      ),
    ],
  );
}
