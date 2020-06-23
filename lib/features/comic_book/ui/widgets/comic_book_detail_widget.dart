import 'package:flutter/material.dart';
import 'package:comicbook/features/comic_book/ui/screens/comic_book_detail_screen/bloc/comic_book_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class ComicBookDetailWidget extends StatelessWidget {
  final String name;
  final String url;
  ComicBookDetailWidget(this.name, this.url);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String urlImage = '';
    return BlocProvider<ComicBookDetailBloc>(create: (_) {
      return ComicBookDetailBloc()..add(LoadImageCredit(url: url));
    }, child: BlocBuilder<ComicBookDetailBloc, ComicBookDetailState>(
        builder: (context, state) {
      if (state is LoadedImageCredit) {
        urlImage = state.urlImage;
      }
      return Row(
        children: <Widget>[
          urlImage == ''
              ? Center(
                  child: Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.all(5),
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ))
              : Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      urlImage,
                      width: width * 0.10,
                    ),
                  ),
                ),
          Flexible(
            child: Text(
              name,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        ],
      );
    }));
  }
}
