import 'package:flutter/material.dart';
import 'http_service.dart';
import 'photo_model.dart';

class PhotoDetail extends StatelessWidget {
  final HttpService httpService = HttpService();
  final Photo photo;

  PhotoDetail({required this.photo});

  @override
  Widget build(BuildContext context) {
    var photo;
    return Scaffold(
        appBar: AppBar(
          title: Text(photo.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await httpService.deletePhoto(photo.id);
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
                        subtitle: Text(photo.title),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${photo.id}"),
                      ),
                      ListTile(
                        title: Text("URL"),
                        subtitle: Text(photo.url),
                      ),
                      ListTile(
                        title: Text("Thumbnail URL"),
                        subtitle: Text(photo.thumbnailUrl),
                      ),
                      ListTile(
                        title: Text("Album ID"),
                        subtitle: Text("${photo.albumId}"),
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