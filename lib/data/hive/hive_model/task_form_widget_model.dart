import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:strokee/domain/entities/task.dart';

class TaskWidgetModel {
  var titleName = ' ';

  void taskSave(BuildContext context) async {
    if (titleName.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    final box = await Hive.openBox<Task>('task_box');
    final task = Task(name: titleName);
    await box.add(task);
  }
}

class TaskWidgetModelProvider extends InheritedWidget {
  final TaskWidgetModel model;

  const TaskWidgetModelProvider({
    Key? key,
    required Widget child,
    required this.model,
  }) : super(key: key, child: child);

  static TaskWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TaskWidgetModelProvider>();
  }

  static TaskWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TaskWidgetModelProvider>()
        ?.widget;
    return widget is TaskWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(TaskWidgetModelProvider oldWidget) {
    return true;
  }
}
