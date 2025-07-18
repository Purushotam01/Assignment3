import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isDone;

  TodoModel({required this.title, this.isDone = false});
}


class TodoRepository {
  final Box<TodoModel> box = Hive.box<TodoModel>('todos');

  List<TodoModel> getTodos() => box.values.toList();

  void addTodo(TodoModel todo) => box.add(todo);

  void updateTodo(int index, TodoModel todo) => box.putAt(index, todo);
  void deleteTodo(int index) => box.deleteAt(index);
}
