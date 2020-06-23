import 'package:comicbook/features/comic_book/models/ComicBookDetail.dart';
import 'package:flutter/cupertino.dart';

abstract class ComicBookDetailState {}

class InitialState extends ComicBookDetailState {
  List<Object> get props => [];
}

class LoadedComicBooksDetail extends ComicBookDetailState {
  final ComicBookDetail comicBookDetail;
  LoadedComicBooksDetail({@required this.comicBookDetail});

  List<Object> get props => [comicBookDetail];
}

class LoadedImageCredit extends ComicBookDetailState {
  final String urlImage;

  @override
  List<Object> get props => [urlImage];
  LoadedImageCredit({@required this.urlImage});
}
