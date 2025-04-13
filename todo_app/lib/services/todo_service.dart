import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo.dart';

class TodoService {
  static const String _todoListKey = 'todo_list_key';

  Future<void> saveTasks(List<Todo> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map> jsonTasks =
        tasks.map((task) => task.toMap()).toList();
    final String jsonString = json.encode(jsonTasks);
    
    await prefs.setString(_todoListKey, jsonString);
  }

  Future<List<Todo>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_todoListKey);
    if (jsonString == null) {
      return [];
    }
    final List<dynamic> jsonTasks = json.decode(jsonString);
    return jsonTasks.map((task) => Todo.fromMap(task)).toList();
  }
}
