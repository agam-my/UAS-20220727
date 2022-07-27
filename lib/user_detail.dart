import 'package:flutter/material.dart';
import 'http_service.dart';
import 'user_model.dart';

class UserDetail extends StatelessWidget {
  final HttpService httpService = HttpService();
  final User user;

  UserDetail({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.name),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await httpService.deleteUser(user.id);
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
                        subtitle: Text(user.name),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${user.id}"),
                      ),
                      ListTile(
                        title: Text("Email"),
                        subtitle: Text("${user.email}"),
                      ),
                      ListTile(
                        title: Text("User ID"),
                        subtitle: Text("${user.username}"),
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