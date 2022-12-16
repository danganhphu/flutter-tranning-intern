import 'package:flutter/material.dart';

import '../model/Photo.dart';

class PhotoItem extends StatelessWidget {
  List<Photo> photos;
  PhotoItem({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(photos.length, (index) => Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
          ),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/no_image.png',
            image: photos[index].thumbnailUrl,
            width: 100,
            height: 100,
          ),
        )
        ),
      ),
    );
  }
}
