import 'package:comicbook/features/comic_book/models/Credits.dart';
import 'package:comicbook/features/comic_book/ui/widgets/comic_book_detail_widget.dart';
import 'package:comicbook/locale/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicbook/features/comic_book/models/ComicBookDetail.dart';

import 'bloc/comic_book_detail.dart';

class ComicBookDetailScreen extends StatelessWidget {
  final int idDetail;
  final String name;
  ComicBookDetailScreen(this.idDetail, this.name);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    ComicBookDetail comicBookDetail;
    return BlocProvider<ComicBookDetailBloc>(create: (_) {
      return ComicBookDetailBloc()..add(LoadComicBookDetail(id: idDetail));
    }, child: BlocBuilder<ComicBookDetailBloc, ComicBookDetailState>(
        builder: (context, state) {
      print("BACK SCREEN");
      if (state is LoadedComicBooksDetail) {
        comicBookDetail = state.comicBookDetail;
        print(state);
      }
      return Scaffold(
          appBar: AppBar(
            title: (Text(name)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 6,
                  child: ListView(
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            AppLocalization().titleCharacters,
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(),
                          comicBookDetail?.characterCredits == null
                              ? Center(child: CircularProgressIndicator())
                              : Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.spaceBetween,
                                  children: addComicBookGridWidgets(
                                      comicBookDetail?.characterCredits ?? []),
                                ),
                          Text(
                            AppLocalization().titleTeams,
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(),
                          comicBookDetail?.personCredits == null
                              ? Center(child: CircularProgressIndicator())
                              : Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.spaceBetween,
                                  children: addComicBookGridWidgets(
                                      comicBookDetail?.personCredits ?? []),
                                ),
                          Text(
                            AppLocalization().titleLocalization,
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(),
                          comicBookDetail?.locationCredits == null
                              ? Center(child: CircularProgressIndicator())
                              : Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.spaceBetween,
                                  children: addComicBookGridWidgets(
                                      comicBookDetail?.locationCredits ?? []),
                                ),
                          Text(
                            AppLocalization().titleConcepts,
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(),
                          comicBookDetail?.conceptCredits == null
                              ? Center(child: CircularProgressIndicator())
                              : Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.spaceBetween,
                                  children: addComicBookGridWidgets(
                                      comicBookDetail?.conceptCredits ?? []),
                                ),
                        ],
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: comicBookDetail?.image?.original_url == null
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: Center(child: CircularProgressIndicator()))
                      : Align(
                          alignment: Alignment.topCenter,
                          child: Image.network(
                            comicBookDetail.image.original_url,
                            height: height * 0.40,
                            width: width * 0.50,
                          ),
                        ),
                )
              ],
            ),
          ));
    }));
  }

  addComicBookGridWidgets(List<Credits> credits) {
    List<ComicBookDetailWidget> comicBookDetailWidget = new List();
    for (Credits credits in credits) {
      comicBookDetailWidget
          .add(ComicBookDetailWidget(credits.name, credits.apiDetailUrl));
    }
    return comicBookDetailWidget;
  }
}
