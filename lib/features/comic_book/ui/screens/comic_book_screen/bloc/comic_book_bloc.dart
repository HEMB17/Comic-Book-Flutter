import 'package:bloc/bloc.dart';
import 'package:comicbook/features/comic_book/data/comic_books_repository.dart';
import 'package:comicbook/features/comic_book/models/ComicBook.dart';

import 'comic_book.dart';

class ComicBookBloc extends Bloc<ComicBookEvent, ComicBookState> {
  @override
  get initialState => InitialState();

  @override
  Stream<ComicBookState> mapEventToState(ComicBookEvent event) async* {
    var currentState = state;
    List<ComicBook> comicBooks = [];
    if (currentState is LoadedComicBooks) {
      comicBooks = currentState.comicBooks;
    }
    if (event is LoadComicBook) {
      List<ComicBook> resultComicBooks = await getIssues();
      comicBooks.addAll(resultComicBooks);
      yield LoadedComicBooks(comicBooks);
    } else if (event is UpdateTypeViewComic) {
      int typeViewComic = event.typeViewComic;
      yield UpdatedTypeViewComic(typeViewComic: typeViewComic);
    }
  }
}
