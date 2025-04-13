import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo, this.onToggle, this.onDelete});
  final Todo todo;
  final void Function(bool?)? onToggle;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[200],
      title: Text(todo.title),
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: onToggle,
      ),
      trailing: IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
    );
  }
}
