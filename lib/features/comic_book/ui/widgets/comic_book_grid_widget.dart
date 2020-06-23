import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comicbook/features/comic_book/ui/screens/comic_book_detail_screen/comic_book_detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class ComicBookGridWidget extends StatelessWidget {
  final int id;
  final String urlImage;
  final String titleComicBook;
  final String dateComicBook;
  ComicBookGridWidget(
      this.id, this.urlImage, this.titleComicBook, this.dateComicBook);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ComicBookDetailScreen(id, titleComicBook)));
      },
      child: Container(
        width: width * 0.50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: <Widget>[
                      Center(child: CircularProgressIndicator()),
                      Center(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: urlImage,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  titleComicBook,
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                child: Text(
                  dateComicBook,
                  style: Theme.of(context).textTheme.body1,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
