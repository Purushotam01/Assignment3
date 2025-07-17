import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model/todo_model.dart';
import 'model/todo_model.g.dart' show TodoModelAdapter;
import 'view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TODO App',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}