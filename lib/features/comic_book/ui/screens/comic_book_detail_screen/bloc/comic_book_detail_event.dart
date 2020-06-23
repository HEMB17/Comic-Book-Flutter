import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ComicBookDetailEvent extends Equatable {
  const ComicBookDetailEvent();
}

class LoadComicBookDetail extends ComicBookDetailEvent {
  final int id;

  @override
  List<Object> get props => [id];
  LoadComicBookDetail({@required this.id});
}

class LoadImageCredit extends ComicBookDetailEvent {
  final String url;

  @override
  List<Object> get props => [url];
  LoadImageCredit({@required this.url});
}
