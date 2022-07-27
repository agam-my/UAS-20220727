import 'package:flutter/foundation.dart';

class Todo {
  late final int userId;
  late final int id;
  late final String title;
  late final String completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as String,
    );
  }
}