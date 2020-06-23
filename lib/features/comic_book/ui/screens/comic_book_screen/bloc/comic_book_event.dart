import 'package:comicbook/features/comic_book/models/ComicBook.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ComicBookEvent extends Equatable {
  const ComicBookEvent();
}

class LoadComicBook extends ComicBookEvent {
  @override
  List<Object> get props => null;
}

class UpdateTypeViewComic extends ComicBookEvent {
  final int typeViewComic;

  @override
  List<Object> get props => [typeViewComic];
  UpdateTypeViewComic({@required this.typeViewComic});
}
