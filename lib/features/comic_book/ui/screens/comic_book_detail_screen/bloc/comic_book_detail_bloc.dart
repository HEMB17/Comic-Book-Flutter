import 'package:bloc/bloc.dart';
import 'package:comicbook/features/comic_book/data/comic_books_detail_repository.dart';
import 'package:comicbook/features/comic_book/models/ComicBookDetail.dart';

import 'comic_book_detail.dart';

class ComicBookDetailBloc
    extends Bloc<ComicBookDetailEvent, ComicBookDetailState> {
  @override
  get initialState => InitialState();

  @override
  Stream<ComicBookDetailState> mapEventToState(
      ComicBookDetailEvent event) async* {
    if (event is LoadComicBookDetail) {
      ComicBookDetail comicBookDetail =
          await getIssuesDetail(event.id.toString());
      yield LoadedComicBooksDetail(comicBookDetail: comicBookDetail);
    } else if (event is LoadImageCredit) {
      String url = event.url;
      url = await getImageCredit(url);
      yield LoadedImageCredit(urlImage: url);
    }
  }
}
