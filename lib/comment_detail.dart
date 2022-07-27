import 'package:flutter/material.dart';
import 'http_service.dart';
import 'comment_model.dart';

class CommentDetail extends StatelessWidget {
  final HttpService httpService = HttpService();
  final Comment comment;

  CommentDetail({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(comment.name),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await httpService.deleteComment(comment.id);
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
                        title: Text("Name"),
                        subtitle: Text(comment.name),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${comment.id}"),
                      ),
                      ListTile(
                        title: Text("Email"),
                        subtitle: Text(comment.email),
                      ),
                      ListTile(
                        title: Text("Body"),
                        subtitle: Text(comment.body),
                      ),
                      ListTile(
                        title: Text("Post ID"),
                        subtitle: Text("${comment.postId}"),
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