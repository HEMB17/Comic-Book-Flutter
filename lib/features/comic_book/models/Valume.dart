class Volume {
  int id;
  String name;

  Volume({
    this.id,
    this.name,
  });

  Volume.fromJson(Map json) {
    this.id = json['id'];
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
