class Todo {
  final String id;
  final String title;
  bool isCompleted;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
  });

  Map toMap() {
    return {
      "id": id,
      "title": title,
      "isCompleted": isCompleted ? 1:0,
      "created at": createdAt.toIso8601String()
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      isCompleted: map['isCompleted'] == 1,
      createdAt: DateTime.parse(map['created at'] ?? DateTime.now().toIso8601String()),
    );
  }
}
