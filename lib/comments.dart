import 'package:flutter/material.dart';
import 'comment_model.dart';
import 'http_service.dart';
import 'comment_detail.dart';

class CommentsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: FutureBuilder(
        future: httpService.getComments(),
        builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
          if (snapshot.hasData) {
            List<Comment> comments = snapshot.data!;
            return ListView(
              children: comments
                  .map(
                    (Comment comment) => ListTile(
                  title: Text(comment.name),
                  subtitle: Text("${comment.postId}"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CommentDetail(
                        comment: comment,
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}