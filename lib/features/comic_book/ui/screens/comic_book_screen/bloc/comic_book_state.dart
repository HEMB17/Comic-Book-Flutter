import 'package:comicbook/features/comic_book/models/ComicBook.dart';
import 'package:flutter/cupertino.dart';

abstract class ComicBookState {
  final List<ComicBook> comicBooks;
  ComicBookState({this.comicBooks});
}

class InitialState extends ComicBookState {
  List<Object> get props => [];
}

class LoadedComicBooks extends ComicBookState {
  LoadedComicBooks(List<ComicBook> comicBooks) : super(comicBooks: comicBooks);
}

class UpdatedTypeViewComic extends ComicBookState {
  final int typeViewComic;
  UpdatedTypeViewComic({@required this.typeViewComic});

  List<Object> get props => [typeViewComic];
}
