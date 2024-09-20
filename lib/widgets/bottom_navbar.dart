import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/providers/nav_provider.dart';

class BottomNavBarWidget extends ConsumerWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentIndex = ref.watch(navBarProvider);
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int i) {
          ref.watch(navBarProvider.notifier).setIndex(i);
        },
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        items: [
          BottomNavigationBarItem(
            label: 'Tasks',
            icon: Icon(Icons.task),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_outlined), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions), label: 'Pending'),
        ]);
  }
}
