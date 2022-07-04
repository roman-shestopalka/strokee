import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  //error adapter
  @HiveField(0)
  String name;

  Task({
    required this.name,
  });
}
