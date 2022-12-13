import 'package:flutter/material.dart';
import 'package:flutterproject/photo/screen/photo_item.dart';

import '../api_request/ApiRequest.dart';
import '../model/Photo.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  late Future<List<Photo>> photos;
  var getData = ApiRequest().getPhoto();
  @override
  void initState() {
    super.initState();
    getData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView with REST API"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: FutureBuilder<List<Photo>> (
              future: getData,
              builder: (context, AsyncSnapshot snapshot)  {
                if (snapshot.hasError) {
                  print('Error is: ${snapshot.error.toString()}');
                }
                return snapshot.hasData ? PhotoItem(photos: snapshot.data) : const Center(child: CircularProgressIndicator());
              }
            )

          ),
        ],
      ),
    );
  }
}


