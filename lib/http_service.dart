import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'post_model.dart';
import 'album_model.dart';
import 'comment_model.dart';
import 'photo_model.dart';
import 'todo_model.dart';
import 'user_model.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";
  final String albumsURL = "https://jsonplaceholder.typicode.com/albums";
  final String commentsURL = "https://jsonplaceholder.typicode.com/comments";
  final String photosURL = "https://jsonplaceholder.typicode.com/photos";
  final String todosURL = "https://jsonplaceholder.typicode.com/todos";
  final String usersURL = "https://jsonplaceholder.typicode.com/users";

  Future<List<Post>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Album>> getAlbums() async {
    Response res = await get(albumsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Album> albums = body
          .map(
            (dynamic item) => Album.fromJson(item),
      )
          .toList();

      return albums;
    } else {
      throw "Unable to retrieve Albums.";
    }
  }

  Future<List<Comment>> getComments() async {
    Response res = await get(commentsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Comment> comments = body
          .map(
            (dynamic item) => Comment.fromJson(item),
      )
          .toList();

      return comments;
    } else {
      throw "Unable to retrieve Comments.";
    }
  }

  Future<List<Photo>> getPhotos() async {
    Response res = await get(photosURL);

    if (res.statusCode == 200) {
      List<dynamic> list = convert.jsonDecode(res.body);

      List<Photo> photos = list
          .map(
            (e) => Photo.fromJson(e)
      )
          .toList();

      return photos;
    } else {
      throw "Unable to retrieve Photos.";
    }
  }

  Future<List<Todo>> getTodos() async {
    Response res = await get(todosURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Todo> todos = body
          .map(
            (dynamic item) => Todo.fromJson(item),
      )
          .toList();

      return todos;
    } else {
      throw "Unable to retrieve Todos.";
    }
  }

  Future<List<User>> getUsers() async {
    Response res = await get(usersURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> users = body
          .map(
            (dynamic item) => User.fromJson(item),
      )
          .toList();

      return users;
    } else {
      throw "Unable to retrieve Users.";
    }
  }

  Future<void> deletePost(int id) async {
    Response res = await delete("$postsURL/$id");

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete post.";
    }
  }

  Future<void> deleteAlbum(int id) async {
    Response res = await delete("$albumsURL/$id");

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete album.";
    }
  }

  Future<void> deleteComment(int id) async {
    Response res = await delete("$commentsURL/$id");

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete comment.";
    }
  }

  Future<void> deletePhoto(int id) async {
    Response res = await delete("$photosURL/$id");

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete photo.";
    }
  }

  Future<void> deleteTodo(int id) async {
    Response res = await delete("$todosURL/$id");

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete todo.";
    }
  }

  Future<void> deleteUser(int id) async {
    Response res = await delete("$usersURL/$id");

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete user.";
    }
  }
}