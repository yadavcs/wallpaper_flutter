import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';

Widget wallpapersList({List<WallpaperModel> wallpapers, BuildContext context}) {
  return Container(
     padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: listPhotos.map((WallpaperModel photoModel) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgPath: photoModel.src.portrait,
                          )));
            },
            child: Hero(
              tag: photoModel.src.portrait,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: kIsWeb
                        ? Image.network(
                            photoModel.src.portrait,
                            height: 50,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: photoModel.src.portrait,
                            placeholder: (context, url) => Container(
                                  color: Color(0xfff5f8fd),
                                ),
                            fit: BoxFit.cover)),
              ),
            ),
          ));
        }).toList()),
      ));
}

Widget BrandName() {
  return Center(
    child: RichText(
      text: TextSpan(
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          children: <TextSpan>[
            TextSpan(text: 'Wallpaper', style: TextStyle(color: Colors.black)),
            TextSpan(text: 'Hub', style: TextStyle(color: Colors.blue))
          ]),
    ),
  );
}
