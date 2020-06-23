import 'package:comicbook/features/comic_book/models/ComicBook.dart';
import 'package:comicbook/features/comic_book/ui/screens/comic_book_screen/bloc/comic_book.dart';
import 'package:comicbook/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:comicbook/features/comic_book/ui/widgets/comic_book_grid_widget.dart';
import 'package:comicbook/features/comic_book/ui/widgets/comic_book_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComicBookHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ComicBook> comicBooks = [];
    int typeViewComic = 2;
    return BlocProvider<ComicBookBloc>(create: (_) {
      return ComicBookBloc()..add(LoadComicBook());
    }, child:
        BlocBuilder<ComicBookBloc, ComicBookState>(builder: (context, state) {
      if (state is InitialState) {
        return Container();
      } else if (state is LoadedComicBooks) {
        comicBooks = state.comicBooks;
      } else if (state is UpdatedTypeViewComic) {
        typeViewComic = state.typeViewComic;
      }
      return Scaffold(
          appBar: AppBar(
            title: (Text(AppLocalization().titleScreenHome)),
            actions: <Widget>[
              IconButton(
                color: Colors.white,
                icon: typeViewComic == 1
                    ? Icon(
                        Icons.list,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.view_column,
                        color: Colors.white,
                      ),
                onPressed: () {
                  BlocProvider.of<ComicBookBloc>(context).add(
                      UpdateTypeViewComic(
                          typeViewComic: typeViewComic == 1 ? 2 : 1));
                },
              )
            ],
          ),
          body: ListView(shrinkWrap: true, children: <Widget>[
            comicBooks.length > 0
                ? Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceBetween,
                    children: typeViewComic == 1
                        ? addComicBookGridWidgets(comicBooks)
                        : addComicBookListWidgets(comicBooks),
                  )
                : Center(child: CircularProgressIndicator())
          ]));
    }));
  }

  addComicBookGridWidgets(List<ComicBook> comicBooks) {
    List<ComicBookGridWidget> comicBookGridWidgets = new List();
    for (ComicBook comicBook in comicBooks) {
      comicBookGridWidgets.add(ComicBookGridWidget(
          comicBook.id,
          comicBook.image.original_url,
          comicBook.volume.name,
          comicBook.cover_date));
    }
    return comicBookGridWidgets;
  }

  addComicBookListWidgets(List<ComicBook> comicBooks) {
    List<ComicBookListWidget> comicBookListWidgets = new List();
    for (ComicBook comicBook in comicBooks) {
      comicBookListWidgets.add(ComicBookListWidget(
          comicBook.id,
          comicBook.image.original_url,
          comicBook.volume.name,
          comicBook.cover_date));
    }
    return comicBookListWidgets;
  }
}
