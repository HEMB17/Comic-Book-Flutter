import 'package:comicbook/features/comic_book/models/Image.dart';
import 'package:comicbook/features/comic_book/models/Valume.dart';

class ComicBook {
  int id;
  String cover_date;
  String description;
  Image image;
  Volume volume;

  ComicBook({
    this.id,
    this.cover_date,
    this.description,
    this.image,
    this.volume,
  });

  ComicBook.fromJson(Map json) {
    this.id = json['id'];
    this.cover_date = json['cover_date'] ?? '';
    this.description = json['description'] ?? '';
    this.image = Image.fromJson(json["image"]);
    this.volume = Volume.fromJson(json["volume"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "cover_date": cover_date,
        "description": description,
        "image": image,
        "volume": volume,
      };
}
