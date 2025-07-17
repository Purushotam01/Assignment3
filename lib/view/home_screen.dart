import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/todo_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoViewModel controller = Get.put(TodoViewModel());
    final TextEditingController titleController = TextEditingController();

    void showTodoDialog({int? index}) {
      titleController.text = index != null ? controller.todos[index].title : '';
      Get.defaultDialog(
        title: index == null ? 'Add TODO' : 'Edit TODO',
        content: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.trim().isEmpty) return;
                index == null
                    ? controller.addTodo(titleController.text)
                    : controller.updateTodo(index, titleController.text);
                Get.back();
              },
              child: Text(index == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('TODO App')),
      body: Obx(() => ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final todo = controller.todos[index];
              return ListTile(
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decoration: todo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (_) => controller.toggleTodo(index),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => showTodoDialog(index: index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => controller.deleteTodo(index),
                    ),
                  ],
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTodoDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}