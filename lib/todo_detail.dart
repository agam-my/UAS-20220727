import 'package:flutter/material.dart';
import 'http_service.dart';
import 'todo_model.dart';

class TodoDetail extends StatelessWidget {
  final HttpService httpService = HttpService();
  final Todo todo;

  TodoDetail({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await httpService.deleteTodo(todo.id);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Title"),
                        subtitle: Text(todo.title),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${todo.id}"),
                      ),
                      ListTile(
                        title: Text("Completed"),
                        subtitle: Text("${todo.completed}"),
                      ),
                      ListTile(
                        title: Text("User ID"),
                        subtitle: Text("${todo.userId}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}