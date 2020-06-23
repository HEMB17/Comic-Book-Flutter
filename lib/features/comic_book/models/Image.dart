class Image {
  String original_url;

  Image({
    this.original_url,
  });

  Image.fromJson(Map json) {
    this.original_url = json['original_url'];
  }

  Map<String, dynamic> toJson() => {
        "original_url": original_url,
      };
}
