import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

String formatTime(TimeOfDay time) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, time.hour, time.minute);
  return DateFormat('HH:mm').format(dateTime);
}

String formatTimeForDetails(DateTime dateTime) {
  return DateFormat('HH:mm').format(dateTime);
}
