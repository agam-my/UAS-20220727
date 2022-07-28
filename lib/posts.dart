import 'package:flutter/material.dart';
import 'post_post.dart';
import 'post_put.dart';
import 'post_patch.dart';
import 'albums.dart';
import 'album_post.dart';
import 'comment_post.dart';
import 'comments.dart';
import 'photos.dart';
import 'todos.dart';
import 'users.dart';
import 'http_service.dart';
import 'post_detail.dart';
import 'post_model.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu API'),
            ),
            ListTile(
              title: const Text('Posts Post'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PostsPost()));
              },
            ),
            ListTile(
              title: const Text('Posts Put'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PostsPut()));
              },
            ),
            ListTile(
              title: const Text('Posts Patch'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PostsPatch()));
              },
            ),
            ListTile(
              title: const Text('Albums'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AlbumsPage()));
              },
            ),
            ListTile(
              title: const Text('Albums Post'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AlbumsPost()));
              },
            ),
            ListTile(
              title: const Text('Comments'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CommentsPage()));
              },
            ),
            ListTile(
              title: const Text('Comments Post'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CommentsPost()));
              },
            ),
            ListTile(
              title: const Text('Photos'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PhotosPage()));
              },
            ),
            ListTile(
              title: const Text('Todos'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => TodosPage()));
              },
            ),
            ListTile(
              title: const Text('Users'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UsersPage()));
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data!;
            return ListView(
              children: posts
                  .map(
                    (Post post) => ListTile(
                  title: Text(post.title),
                  subtitle: Text("${post.userId}"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PostDetail(
                        post: post,
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