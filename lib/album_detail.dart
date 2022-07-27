import 'package:flutter/material.dart';
import 'http_service.dart';
import 'album_model.dart';

class AlbumDetail extends StatelessWidget {
  final HttpService httpService = HttpService();
  final Album album;

  AlbumDetail({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(album.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await httpService.deleteAlbum(album.id);
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
                        subtitle: Text(album.title),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${album.id}"),
                      ),
                      ListTile(
                        title: Text("User ID"),
                        subtitle: Text("${album.userId}"),
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