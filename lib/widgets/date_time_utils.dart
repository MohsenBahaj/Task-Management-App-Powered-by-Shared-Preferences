// utils/date_time_utils.dart

import 'package:flutter/material.dart';

DateTime combineDateTime(DateTime date, TimeOfDay time) {
  return DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );
}
