import 'package:hive_flutter/adapters.dart';
import 'package:todo_apps/model/todo_model.dart';

class TodoModelAdapter extends TypeAdapter<TodoModel> {
  @override
  final int typeId = 0;

  @override
  TodoModel read(BinaryReader reader) {
    return TodoModel(
      title: reader.readString(),
      isDone: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, TodoModel obj) {
    writer.writeString(obj.title);
    writer.writeBool(obj.isDone);
  }
}
