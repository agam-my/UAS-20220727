import 'package:flutter/material.dart';
import 'photo_model.dart';
import 'http_service.dart';
import 'photo_detail.dart';

class PhotosPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: FutureBuilder(
        future: httpService.getPhotos(),
        builder: (BuildContext context, AsyncSnapshot<List<Photo>> snapshot) {
          if (snapshot.hasData) {
            List<Photo> photos = snapshot.data!;
            return ListView(
              children: photos
                  .map(
                    (Photo photo) => ListTile(
                  title: Text(photo.title),
                  subtitle: Text("${photo.albumId}"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PhotoDetail(
                        photo: photo,
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