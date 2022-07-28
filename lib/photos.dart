import 'package:flutter/material.dart';
import 'photo_model.dart';
import 'http_service.dart';
import 'photo_detail.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  State<PhotosPage> createState() {
    return _PhotosPageState();
  }
}

class _PhotosPageState extends State<PhotosPage> {
  final HttpService httpService = HttpService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: FutureBuilder<List<Photo>>(
        future: httpService.getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                Photo photo = snapshot.data![index];
                return Container(
                  width: 180,
                  height: 139,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(photo.thumbnailUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}