import 'package:get/get.dart';
import '../model/todo_model.dart';

class TodoViewModel extends GetxController {
  final TodoRepository repository = TodoRepository();
  var todos = <TodoModel>[].obs;

  @override
  void onInit() {
    loadTodos();
    super.onInit();
  }

  void loadTodos() {
    todos.value = repository.getTodos();
  }

  void addTodo(String title) {
    final todo = TodoModel(title: title);
    repository.addTodo(todo);
    loadTodos();
  }

  void updateTodo(int index, String title) {
    final todo = todos[index];
    todo.title = title;
    repository.updateTodo(index, todo);
    loadTodos();
  }

  void toggleTodo(int index) {
    final todo = todos[index];
    todo.isDone = !todo.isDone;
    repository.updateTodo(index, todo);
    loadTodos();
  }

  void deleteTodo(int index) {
    repository.deleteTodo(index);
    loadTodos();
  }
}