import 'package:comicbook/features/comic_book/models/Image.dart';
import 'package:comicbook/features/comic_book/models/Credits.dart';

class ComicBookDetail {
  String name;
  Image image;
  List<Credits> characterCredits;
  List<Credits> personCredits;
  List<Credits> locationCredits;
  List<Credits> conceptCredits;

  ComicBookDetail({
    this.name,
    this.image,
    this.characterCredits,
    this.conceptCredits,
  });

  ComicBookDetail.fromJson(Map json) {
    this.name = json["name"];
    this.image = Image.fromJson(json["image"]);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
