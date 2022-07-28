import 'package:flutter/material.dart';
import 'http_service.dart';
import 'post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Post> createPost(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/comments'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create comment.');
  }
}

class PostsPost extends StatefulWidget {
  const PostsPost({super.key});

  @override
  State<PostsPost> createState() {
    return _PostsPostState();
  }
}

class _PostsPostState extends State<PostsPost> {
  final HttpService httpService = HttpService();
  final TextEditingController _controller = TextEditingController();
  Future<Post>? _futurePost;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futurePost == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futurePost = createPost(_controller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Post> buildFutureBuilder() {
    return FutureBuilder<Post>(
      future: _futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}