class Credits {
  String name;
  String apiDetailUrl;

  Credits({
    this.name,
    this.apiDetailUrl,
  });

  Credits.fromJson(Map json) {
    this.name = json['name'];
    this.apiDetailUrl = json['api_detail_url'];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "apiDetailUrl": apiDetailUrl,
      };
}
