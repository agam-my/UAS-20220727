import 'package:flutter/material.dart';
import 'album_model.dart';
import 'http_service.dart';
import 'album_detail.dart';

class AlbumsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Albums"),
      ),
      body: FutureBuilder(
        future: httpService.getAlbums(),
        builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
          if (snapshot.hasData) {
            List<Album> albums = snapshot.data!;
            return ListView(
              children: albums
                  .map(
                    (Album album) => ListTile(
                  title: Text(album.title),
                  subtitle: Text("${album.userId}"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AlbumDetail(
                        album: album,
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