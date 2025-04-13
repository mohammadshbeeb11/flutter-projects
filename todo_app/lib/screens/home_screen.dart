import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoItems = [];

  TextEditingController controller = TextEditingController();

  TodoService todoService = TodoService();

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void loadTasks() async {
    final loadedTasks = await todoService.loadTasks();
    setState(() {
      todoItems = loadedTasks;
    });
  }

  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            actionsPadding: EdgeInsets.all(20),
            backgroundColor: Colors.grey,
            actions: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Add a new task",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todoItems.add(
                          Todo(
                            id: "${todoItems.length}",
                            title: controller.text,
                            isCompleted: false,
                            createdAt: DateTime.now(),
                          ),
                        );
                        controller.clear();
                        todoService.saveTasks(todoItems);
                      });
                    },
                    child: Text("Save"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      controller.clear();
                    },
                    child: Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To-Do List")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder:
            (context, index) => TodoItem(
              todo: todoItems[index],
              onToggle: (p0) {
                setState(() {
                  todoItems[index].isCompleted = p0!;
                });
                todoService.saveTasks(todoItems);
              },
              onDelete: () {
                setState(() {
                  todoItems.removeAt(index);
                });
                todoService.saveTasks(todoItems);
              },
            ),
      ),
    );
  }
}
